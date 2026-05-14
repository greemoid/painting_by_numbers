import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paiting_by_numbers/core/cubits/base/failure.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/snack_bar/custom_snack_bar.dart';

class FailureListener extends StatefulWidget {
  final Widget child;

  const FailureListener({required this.child, super.key});

  @override
  State<FailureListener> createState() => _FailureListenerState();
}

class _FailureListenerState extends State<FailureListener> {
  late final StreamSubscription<Failure> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = locator<FailureNotifier>().failureStream.listen(_onFailure);
  }

  void _onFailure(Failure failure) {
    CustomSnackBar.showErrorSnackBar(message: failure.messageKey.tr());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
