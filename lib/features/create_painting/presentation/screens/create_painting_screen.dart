import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CreatePaintingScreen extends StatelessWidget {
  const CreatePaintingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShadTheme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Create Painting'),
        centerTitle: false,
      ),
      body: const Center(
        child: Text('Create Painting Placeholder'),
      ),
    );
  }
}
