class GeneratedPaintingEntity {
  final String id;
  final String? networkId;
  final String name;
  final String artist;
  final int year;
  final String localImagePath;
  final List<String> colors;
  final DateTime createdAt;

  GeneratedPaintingEntity({
    required this.id,
    this.networkId,
    required this.name,
    required this.artist,
    required this.year,
    required this.localImagePath,
    required this.colors,
    required this.createdAt,
  });
}
