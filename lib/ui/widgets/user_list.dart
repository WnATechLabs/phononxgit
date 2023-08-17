import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:phononxgit/core/core.dart';
import './user_list_tile.dart';

class UserList extends StatelessWidget {
  final BuiltList<UserModel> users;

  const UserList({super.key, required this.users});

  Widget? _itemBuilder(BuildContext context, int index) {
    final isFirst = index == 0;
    final isLast = index == users.length - 1;
    return Padding(
      padding: EdgeInsets.only(
        top: isFirst ? 0 : 4,
        bottom: isLast ? 0 : 4,
      ),
      child: UserListTile(
        user: users[index],
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: users.length,
      shrinkWrap: true,
    );
  }
}
