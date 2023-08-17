import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:phononxgit/core/external/built_value/build_value.dart';


part 'user.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  String get username;

  String get avatarUrl;

  int get repoCount;

  UserModel._();

  factory UserModel([void Function(UserModelBuilder) updates]) = _$UserModel;


  Object toJson() {
    return serializers.serializeWith(UserModel.serializer, this)!;
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserModel.serializer, json)!;
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}

