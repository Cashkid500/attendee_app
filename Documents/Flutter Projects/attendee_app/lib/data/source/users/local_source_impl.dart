import 'package:attendee_app/data/source/users/local_source_abstract.dart';
import 'package:attendee_app/models/users/response/login.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userKey = 'auth_user';

  @override
  Future<bool> clearAuthenticatedUser() async {
    final box = await Hive.openBox<LoginResponse >(_userKey);

    try {
      box.clear();
      return true;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {}
  }

  @override
  Future<LoginResponse > saveAuthenticaLoginResponse(LoginResponse  authUser) async {
    final box = await Hive.openBox<LoginResponse >(_userKey);

    try {
      await box.put(_userKey, authUser);
      return authUser;
    } on Exception catch (e) {
      throw Exception(e);
    } finally {}
  }

  @override
  Future<LoginResponse ?> getAuthenticatedUser() async {
    final box = await Hive.openBox<LoginResponse >(_userKey);

    try {
      final authCred = box.get(_userKey);
      return authCred;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<LoginResponse ?> streamUserStatus() async* {
    final box = await Hive.openBox<LoginResponse >(_userKey);

    yield* box.watch(key: _userKey).map((event) {
      return event.value as LoginResponse ;
    }).asBroadcastStream();
  }
}