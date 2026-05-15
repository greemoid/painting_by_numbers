import 'package:flutter/material.dart';
import 'package:paiting_by_numbers/core/di/locator.dart';
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/log_out_use_case.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main / Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Main Flow!'),
            const SizedBox(height: 24),
            ShadButton(
              onPressed: () async {
                await locator<LogOutUseCase>().call();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
