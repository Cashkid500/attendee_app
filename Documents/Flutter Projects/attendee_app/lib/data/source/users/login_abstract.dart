import 'package:attendee_app/models/users/body/login.dart';
import 'package:attendee_app/models/users/response/login.dart';

abstract class Login{
  Future<LoginResponse> login({
    required LoginModel value,
  });
}