import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/app_bar/common_app_bar.dart';
import 'package:paiting_by_numbers/features/home/presentation/widgets/paintings_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<Map<String, dynamic>> _myPaintings;
  late final List<Map<String, dynamic>> _explorePaintings;
  String _currentTab = 'my_paintings';

  @override
  void initState() {
    super.initState();
    _myPaintings = _generateMockData(15, seed: 1);
    _explorePaintings = _generateMockData(40, seed: 2);
  }

  List<Map<String, dynamic>> _generateMockData(int count, {int seed = 0}) {
    final random = Random(seed);
    final titles = [
      'The Last Supper',
      'The Birth of Venus',
      'Mona Lisa',
      'The School of Athens',
      'The Creation of Adam',
      'Lady with an Ermine',
      'Primavera',
      'Sistine Madonna',
      'The Night Watch',
      'Girl with a Pearl Earring',
      'The Starry Night',
      'The Kiss',
    ];
    final authors = [
      'Leonardo da Vinci',
      'Sandro Botticelli',
      'Raphael',
      'Michelangelo',
      'Rembrandt',
      'Johannes Vermeer',
      'Vincent van Gogh',
      'Gustav Klimt',
    ];

    return List.generate(count, (index) {
      return {
        'title': '${titles[random.nextInt(titles.length)]} ${index + 1}',
        'author': authors[random.nextInt(authors.length)],
        'year': '${1450 + random.nextInt(550)}',
        'imageHeight': (180 + random.nextInt(120)).h,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: const CommonAppBar(title: 'Gallery', showBottomBorder: false),
      body: Column(
        children: [
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: colorScheme.muted.withValues(alpha: 0.5),
                borderRadius: BorderRadius.all(AppBorderRadiuses.rounded),
                border: Border.all(color: colorScheme.border),
              ),
              child: ShadTabs<String>(
                value: _currentTab,
                onChanged: (v) => setState(() => _currentTab = v),
                gap: 0,
                contentConstraints: BoxConstraints.tight(Size.zero),
                tabBarConstraints: BoxConstraints(maxWidth: 1.sw - 40.w),
                decoration: const ShadDecoration(
                  border: ShadBorder.none,
                  color: Colors.transparent,
                ),
                tabs: [
                  ShadTab(
                    value: 'my_paintings',
                    child: Text(
                      'My Paintings',
                      style: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    ),
                  ),
                  ShadTab(
                    value: 'explore',
                    child: Text(
                      'Explore',
                      style: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          8.verticalSpace,
          // Content Area
          Expanded(
            child: _currentTab == 'my_paintings'
                ? PaintingsGrid(items: _myPaintings)
                : PaintingsGrid(items: _explorePaintings),
          ),
        ],
      ),
    );
  }
}
