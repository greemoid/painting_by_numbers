import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppLoader extends StatelessWidget {
  final double? size;
  final Color? color;

  const AppLoader({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveColor = color ?? theme.colorScheme.primary;

    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoActivityIndicator(
        radius: (size ?? 20) / 2,
        color: effectiveColor,
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
      ),
    );
  }
}
