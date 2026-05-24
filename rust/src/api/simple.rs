use crate::quantizer::quantize_image;
use crate::vectorizer::{vectorize_to_svg, VectorizerOptions};
use image::load_from_memory;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - handles panics, logging, etc.
    flutter_rust_bridge::setup_default_user_utils();
}

pub struct PaletteEntry {
    pub rgb: [u8; 3],
    pub hex: String,
}

pub struct VectorizationResult {
    pub svg_content: String,
    pub palette: Vec<PaletteEntry>,
}

pub async fn vectorize_image_to_svg(image_bytes: Vec<u8>, colors: u32) -> anyhow::Result<VectorizationResult> {
    // 1. DECODE IMAGE
    let img = load_from_memory(&image_bytes)?;

    // 2. PREPROCESS
    let processed = crate::processor::preprocess_image_internal(img, 800, 1.5)?;

    // 3. QUANTIZATION
    let quantized = quantize_image(&processed.image, colors)?;

    let palette: Vec<PaletteEntry> = quantized.palette.iter().map(|rgb| {
        let hex = format!("#{key:02x}{key1:02x}{key2:02x}", key = rgb[0], key1 = rgb[1], key2 = rgb[2]);
        PaletteEntry { rgb: *rgb, hex }
    }).collect();

    // 4. VECTORIZATION
    let svg_content = vectorize_to_svg(&quantized.image, VectorizerOptions {
        min_area: 2,
        color_precision: 8,
        path_precision: 3,
    })?;

    Ok(VectorizationResult {
        svg_content,
        palette,
    })
}
