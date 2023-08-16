import 'package:flutter/material.dart';
import './core/core.dart';
import './ui/ui.dart';

void main() {
  runApp(const PhoneXGit());
}

class PhoneXGit extends StatelessWidget {
  const PhoneXGit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
