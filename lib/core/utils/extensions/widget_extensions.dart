import 'package:flutter/widgets.dart';

extension WidgetToSliverExtension on Widget {
  Widget toSliver() => SliverToBoxAdapter(child: this);
}
