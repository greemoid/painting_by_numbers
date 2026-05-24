use image::{DynamicImage, GenericImageView};
use imageproc::filter::gaussian_blur_f32;
use anyhow::{Result};

pub struct ProcessedImage {
    pub image: DynamicImage,
    pub width: u32,
    pub height: u32,
}

pub fn preprocess_image_internal(
    mut img: DynamicImage,
    max_width: u32,
    blur_amount: f32, // sigma for gaussian blur
) -> Result<ProcessedImage> {
    ("🧹 Preprocessing image...");

    let (width, height) = img.dimensions();

    // 2. Resize if necessary
    if width > max_width {
        let new_height = (height as f64 * (max_width as f64 / width as f64)) as u32;
        img = img.resize(max_width, new_height, image::imageops::FilterType::Lanczos3);
    }

    let (w, h) = img.dimensions();

    // 3. Blur for noise reduction
    let rgba_buffer = img.to_rgba8();
    
    let final_img = if blur_amount > 0.0 {
        let filtered = gaussian_blur_f32(&rgba_buffer, blur_amount);
        DynamicImage::ImageRgba8(filtered)
    } else {
        img
    };

    Ok(ProcessedImage {
        image: final_img,
        width: w,
        height: h,
    })
}
