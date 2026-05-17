import 'package:paiting_by_numbers/features/home/domain/entities/painting.dart';

class PaintingsPage {
  final List<Painting> items;
  final int total;

  const PaintingsPage({required this.items, required this.total});
}
