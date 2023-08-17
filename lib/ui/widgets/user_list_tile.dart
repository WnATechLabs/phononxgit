import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phononxgit/core/core.dart';

class UserListTile extends StatelessWidget {
  final UserModel user;
  final height = 48.0;

  const UserListTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return SizedBox(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              width: height,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.network(
                user.avatarUrl,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: t.textTheme.titleMedium,
                  ),
                  const Gap(4),
                  Text(
                    'repo count: ${user.repoCount}',
                    style: t.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
