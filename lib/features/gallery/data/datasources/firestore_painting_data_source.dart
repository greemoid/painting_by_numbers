import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/features/gallery/data/models/painting_model.dart';

abstract interface class PaintingDataSource {
  Stream<List<GeneratedPaintingModel>> watchPaintings(String userId);
  Future<void> savePainting(String userId, GeneratedPaintingModel painting);
}

@LazySingleton(as: PaintingDataSource)
class FirestorePaintingDataSource implements PaintingDataSource {
  final FirebaseFirestore _firestore;

  FirestorePaintingDataSource(this._firestore);

  @override
  Stream<List<GeneratedPaintingModel>> watchPaintings(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('paintings')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => GeneratedPaintingModel.fromFirestore(doc)).toList();
    });
  }

  @override
  Future<void> savePainting(String userId, GeneratedPaintingModel painting) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('paintings')
        .doc(painting.id)
        .set(painting.toFirestore());
  }
}
