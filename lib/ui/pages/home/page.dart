import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phononxgit/core/core.dart';
import 'package:phononxgit/ui/widgets/widgets.dart';

final BuiltList<UserModel> users = BuiltList.from([
  UserModel((b) => b
    ..username = 'test username 1'
    ..avatarUrl =
        'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg'
    ..repoCount = 4),
  UserModel((b) => b
    ..username = 'test username 2'
    ..avatarUrl =
        'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg'
    ..repoCount = 4),
  UserModel((b) => b
    ..username = 'test username 3'
    ..avatarUrl =
        'https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg'
    ..repoCount = 4),
]);

class HomePage extends StatelessWidget {
  const HomePage({super.key = const Key('HomePage')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(),
            const Gap(16),
            Expanded(
              child: UserList(
                users: users,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
