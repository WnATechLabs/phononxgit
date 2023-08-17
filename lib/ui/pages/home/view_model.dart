import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phononxgit/core/core.dart';
import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';

class HomePageViewModel {
  static const _tag = 'HomePageViewModel';
  final UsersRemoteDaoI usersService = UsersDaoMock();

  TextEditingController controller = TextEditingController(text: '');
  String _cachedQuery = '';

  Timer? _debounce;
  final Duration _debounceOffset = const Duration(milliseconds: 500);

  BehaviorSubject<BuiltList<UserModel>?> usersStream =
      BehaviorSubject.seeded(BuiltList.from([]));
  StreamSubscription? _latestSubscription;

  Future<void> init() async {
    controller.addListener(() async {
      final incomingQuery = controller.value.text;
      if (_cachedQuery != incomingQuery) {
        _cachedQuery = incomingQuery;
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(_debounceOffset, () async {
          await onSearch(incomingQuery);
        });
      }
    });
  }

  Future<void> onSearch(String query) async {
    if (_latestSubscription != null) {
      try {
        await _latestSubscription!.cancel();
      } catch (e) {
        debugPrint(
            '$_tag - while cancelling subscription, possible data leak.');
        debugPrint('$e');
      }
    }
    // We assume that if the latest event of the stream is null then we
    // fetching new data
    usersStream.add(null);
    final resultStream = Rx.fromCallable<BuiltList<UserModel>>(
        () => usersService.getUsers(query));
    _latestSubscription = resultStream.listen((event) {
      usersStream.add(event);
    }, onError: (error) {
      usersStream.addError(error);
    });
  }

  Future<void> dispose() async {
    controller.dispose();
    _debounce?.cancel();
    if (_latestSubscription != null) {
      try {
        await _latestSubscription!.cancel();
      } catch (e) {
        debugPrint(
            '$_tag - error while cancelling subscription, possible data leak.');
        debugPrint('$e');
      }
    }
  }
}
