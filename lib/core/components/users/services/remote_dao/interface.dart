import 'package:built_collection/built_collection.dart';
import '../../models/models.dart';

abstract class UsersRemoteDaoI {
  Future<BuiltList<UserModel>> getUsers(String query);
}
