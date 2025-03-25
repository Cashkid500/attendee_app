import 'package:attendee_app/models/users/response/login.dart';

abstract class AuthLocalDataSource {
  Future<LoginResponse > saveAuthenticaLoginResponse (LoginResponse  authUser);
  Future<bool> clearAuthenticatedUser();
  Future<LoginResponse ?> getAuthenticatedUser();
  Stream<LoginResponse ?> streamUserStatus();
}