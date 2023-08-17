import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserListTile extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final int repoCount;
  final height = 48.0;

  const UserListTile({
    super.key,
    required this.username,
    required this.avatarUrl,
    required this.repoCount,
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
                avatarUrl,
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
                    username,
                    style: t.textTheme.titleMedium,
                  ),
                  const Gap(4),
                  Text(
                    'repo count: $repoCount',
                    style: t.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
