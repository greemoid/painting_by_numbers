use image::{DynamicImage, GenericImageView, ImageBuffer, Rgba};
use ndarray::Array2;

use rkm;
use anyhow::{Result};

pub struct QuantizationResult {
    pub image: DynamicImage,
    pub palette: Vec<[u8; 3]>,
}

pub fn quantize_image(
    img: &DynamicImage,
    k: u32,
) -> Result<QuantizationResult> {
    let (width, height) = img.dimensions();
    let pixels_rgb = img.to_rgb8();
    let raw_pixels = pixels_rgb.as_raw();
    
    // 1. Sampling for palette generation
    let pixel_count = width * height;
    let sample_step = (pixel_count / 10000).max(1);
    
    let mut sampled_points: Vec<f32> = Vec::with_capacity(10000 * 3);
    let mut count = 0;
    for i in (0..raw_pixels.len()).step_by(3 * sample_step as usize) {
        if i + 2 < raw_pixels.len() {
            sampled_points.push(raw_pixels[i] as f32);
            sampled_points.push(raw_pixels[i+1] as f32);
            sampled_points.push(raw_pixels[i+2] as f32);
            count += 1;
        }
    }

    // Create Array2 for rkm
    let data = Array2::from_shape_vec((count, 3), sampled_points)?;

    // 2. K-Means
    let (centroids, _): (Array2<f32>, Vec<usize>) = rkm::kmeans_lloyd(&data.view(), k as usize);

    // Extract centroids back to Vec<[u8; 3]>
    let mut byte_centroids: Vec<[u8; 3]> = Vec::with_capacity(k as usize);
    for i in 0..centroids.rows() {
        let row = centroids.row(i);

        byte_centroids.push([
            row[0].round().clamp(0.0, 255.0) as u8,
            row[1].round().clamp(0.0, 255.0) as u8,
            row[2].round().clamp(0.0, 255.0) as u8
        ]);
    }

    // Sort palette by luminance safely to prevent panics on NaN
    byte_centroids.sort_by(|a, b| {
        let lum_a = 0.2126 * (a[0] as f32) + 0.7152 * (a[1] as f32) + 0.0722 * (a[2] as f32);
        let lum_b = 0.2126 * (b[0] as f32) + 0.7152 * (b[1] as f32) + 0.0722 * (b[2] as f32);
        lum_b.partial_cmp(&lum_a).unwrap_or(std::cmp::Ordering::Equal)
    });

    // 3. Mapping
    let mut quantized_buffer = ImageBuffer::new(width, height);
    for (x, y, pixel) in pixels_rgb.enumerate_pixels() {
        let (pr, pg, pb) = (pixel[0] as f32, pixel[1] as f32, pixel[2] as f32);
        
        let mut min_dist = f32::INFINITY;
        let mut best_index = 0;

        for (idx, c) in byte_centroids.iter().enumerate() {
            let dr = pr - c[0] as f32;
            let dg = pg - c[1] as f32;
            let db = pb - c[2] as f32;
            let dist = dr*dr + dg*dg + db*db;
            if dist < min_dist {
                min_dist = dist;
                best_index = idx;
            }
        }
        
        let c = byte_centroids[best_index];
        quantized_buffer.put_pixel(x, y, Rgba([c[0], c[1], c[2], 255]));
    }

    Ok(QuantizationResult {
        image: DynamicImage::ImageRgba8(quantized_buffer),
        palette: byte_centroids,
    })
}
