import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phononxgit/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key = const Key('HomePage')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(),
            Gap(8),
            Expanded(
              child: Placeholder(
                fallbackHeight: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
