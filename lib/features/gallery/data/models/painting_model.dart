import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paiting_by_numbers/features/gallery/domain/entities/painting_entity.dart';

class GeneratedPaintingModel extends GeneratedPaintingEntity {
  GeneratedPaintingModel({
    required super.id,
    super.networkId,
    required super.name,
    required super.artist,
    required super.year,
    required super.localImagePath,
    required super.colors,
    required super.createdAt,
  });

  factory GeneratedPaintingModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return GeneratedPaintingModel(
      id: doc.id,
      networkId: data['networkId'] as String?,
      name: data['name'] ?? '',
      artist: data['artist'] ?? '',
      year: data['year'] ?? 0,
      localImagePath: data['localImagePath'] ?? '',
      colors: List<String>.from(data['colors'] ?? []),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'networkId': networkId,
      'name': name,
      'artist': artist,
      'year': year,
      'localImagePath': localImagePath,
      'colors': colors,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory GeneratedPaintingModel.fromEntity(GeneratedPaintingEntity entity) {
    return GeneratedPaintingModel(
      id: entity.id,
      networkId: entity.networkId,
      name: entity.name,
      artist: entity.artist,
      year: entity.year,
      localImagePath: entity.localImagePath,
      colors: entity.colors,
      createdAt: entity.createdAt,
    );
  }
}
