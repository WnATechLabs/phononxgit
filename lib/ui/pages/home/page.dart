import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phononxgit/core/core.dart';
import 'package:phononxgit/ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key = const Key('HomePage')});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usersService = UsersDaoMock();
  BuiltList<UserModel> users = BuiltList.from([]);
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    usersService.getUsers('test query').then((results) {
      setState(() {
        users = results;
        isLoading = false;
      });
    });
  }

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
              child: !isLoading
                  ? UserList(
                      users: users,
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
