import 'package:flutter/material.dart';

/// Temporary placeholder for screens that do not have a real implementation yet.
class FlowPlaceholderScreen extends StatelessWidget {
  const FlowPlaceholderScreen({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'TODO: $label',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
