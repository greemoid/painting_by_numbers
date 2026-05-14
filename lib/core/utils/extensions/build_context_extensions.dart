import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension BuildContexUtils on BuildContext {
  TextTheme get styles => Theme.of(this).textTheme;

  ShadThemeData get shadTheme => ShadTheme.of(this);

  ShadColorScheme get colorScheme => ShadTheme.of(this).colorScheme;
}
