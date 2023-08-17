import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phononxgit/core/core.dart';
import 'package:phononxgit/ui/pages/home/view_model.dart';
import 'package:phononxgit/ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key = const Key('HomePage')});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _vm = HomePageViewModel();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _vm.init();
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
            TextField(
              controller: _vm.controller,
            ),
            const Gap(16),
            Expanded(
              child: !isLoading
                  ? StreamBuilder<BuiltList<UserModel>?>(
                      stream: _vm.usersStream,
                      initialData: null,
                      builder: (context, snapshot) {
                        final users = snapshot.data;
                        // This decision making could be turn into a widget
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text(
                              'Something went wrong, please try a new search.',
                            ),
                          );
                        }
                        if (users == null) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (users.isEmpty) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'No data.',
                              ),
                            ),
                          );
                        }
                        return UserList(
                          users: users,
                        );
                      })
                  : const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
