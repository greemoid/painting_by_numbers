class PaletteColor {
  final List<int> rgb;
  final String hex;

  const PaletteColor({
    required this.rgb,
    required this.hex,
  });
}

class QuantizationResult {
  final String svgContent;
  final List<PaletteColor> palette;

  const QuantizationResult({
    required this.svgContent,
    required this.palette,
  });
}
