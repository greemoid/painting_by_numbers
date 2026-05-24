use image::{DynamicImage, GenericImageView};
use anyhow::{Result};
use vtracer::{Config, ColorMode, Hierarchical, ColorImage, convert};
use visioncortex::PathSimplifyMode;

pub struct VectorizerOptions {
    pub min_area: usize,
    pub color_precision: usize,
    pub path_precision: u32,
}

pub fn vectorize_to_svg(
    img: &DynamicImage,
    options: VectorizerOptions,
) -> Result<String> {

    let (width, height) = img.dimensions();
    let pixels = img.to_rgba8();
    
    let mut config = Config::default();
    config.color_mode = ColorMode::Color;
    config.color_precision = options.color_precision as i32;
    config.filter_speckle = options.min_area;
    config.path_precision = Some(options.path_precision);
    config.mode = PathSimplifyMode::Spline;
    config.hierarchical = Hierarchical::Stacked;

    let color_image = ColorImage {
        pixels: pixels.as_raw().to_vec(),
        width: width as usize,
        height: height as usize,
    };
    
    let svg_file = convert(color_image, config)
        .map_err(|e| anyhow::anyhow!(e))?;

    Ok(format!("{}", svg_file))
}
