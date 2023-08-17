import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:phononxgit/core/external/external.dart' as external_libs;

import './interface.dart';
import '../../models/models.dart';

class UsersDaoGithub implements UsersRemoteDaoI {
  final httpClient = external_libs.httpClient;
  @override
  Future<BuiltList<UserModel>> getUsers(String query) async {
    const path = '/search/users';
    try {
      final results = await httpClient.get(path, queryParameters: {
        "q": query,
        "per_page": 20,
      });
      debugPrint('results');
      debugPrint('$results');
      if (results.data == null) {
        throw TypeError();
      }
      final listResults = (results.data['items'] as List<dynamic>)
          .map(
            (e) => UserModel(
              (b) => b
                ..username = e['login']
                ..repoCount = 7 // TODO: get repo count
                ..avatarUrl = e['avatar_url'],
            ),
          )
          .toList();
      return BuiltList.from(listResults);
    } catch (e) {
      // todo: parse errors to a non-external data model
      debugPrint('$e');
      rethrow;
    }
  }
}
