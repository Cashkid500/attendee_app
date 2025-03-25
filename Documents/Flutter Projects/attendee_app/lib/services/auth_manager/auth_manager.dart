import 'package:attendee_app/data/source/users/local_source_impl.dart';
import 'package:attendee_app/models/users/response/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<AuthManager?>((ref) => AuthManager.instance);

final streamUserProvider = StreamProvider.autoDispose<LoginResponse?>((ref) async* {
  yield* AuthManager.instance.streamActiveUser();
});

class AuthManager {
  static final AuthManager instance = AuthManager._();
  final AuthLocalDataSourceImpl _authlocalDataSource =
      AuthLocalDataSourceImpl();


  LoginResponse ? userCred;

  AuthManager._() {
    init();
  }

  Future<void> init() async {
    userCred = await _authlocalDataSource.getAuthenticatedUser();
  }

  Future<LoginResponse > saveAuthenticatedUser(LoginResponse  authUser) async {
    return userCred =
        await _authlocalDataSource.saveAuthenticaLoginResponse(authUser);
  }

  Future<LoginResponse ?> getAuthenticatedUser() async {
    return userCred = await _authlocalDataSource.getAuthenticatedUser();
  }

  Future<bool> clearAuthenticatedUser() async {
    await _authlocalDataSource.clearAuthenticatedUser();

    userCred = null;

    return true;
  }

  Stream<LoginResponse?> streamActiveUser() async* {
    yield* _authlocalDataSource
        .streamUserStatus()
        .map((event) => userCred = event)
        .asBroadcastStream();
  }
}