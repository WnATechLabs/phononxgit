import 'package:built_collection/built_collection.dart';

import './interface.dart';
import '../../models/models.dart';

class UsersDaoMock implements UsersRemoteDaoI {
  @override
  Future<BuiltList<UserModel>> getUsers(String query) async {
    await Future.delayed(const Duration(seconds: 2));
    return mockUsers;
  }
}


final BuiltList<UserModel> mockUsers = BuiltList.from([
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
