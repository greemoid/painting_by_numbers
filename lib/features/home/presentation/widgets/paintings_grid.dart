import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/features/home/presentation/widgets/painting_card.dart';

class PaintingsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const PaintingsGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final leftColumnItems = <Widget>[];
    final rightColumnItems = <Widget>[];

    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      final card = PaintingCard(
        title: item['title'] as String,
        author: item['author'] as String,
        year: item['year'] as String,
        imageHeight: item['imageHeight'] as double,
      );

      if (i % 2 == 0) {
        leftColumnItems.add(card);
        leftColumnItems.add(16.verticalSpace);
      } else {
        rightColumnItems.add(card);
        rightColumnItems.add(16.verticalSpace);
      }
    }

    // Adding an extra space at the end to account for the bottom navigation bar
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 8.h,
        bottom: 120.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Column(children: leftColumnItems)),
          16.horizontalSpace,
          Expanded(child: Column(children: rightColumnItems)),
        ],
      ),
    );
  }
}
