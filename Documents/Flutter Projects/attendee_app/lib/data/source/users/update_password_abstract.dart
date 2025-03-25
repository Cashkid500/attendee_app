import 'package:attendee_app/models/users/body/update_password.dart';
import 'package:attendee_app/models/users/response/update_password.dart';

abstract class UpdatePasswordSource {
  Future<UpdatePasswordResponse> updatePassword(
      {required UpdatePasswordModel payload});
}
