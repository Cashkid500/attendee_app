import 'package:attendee_app/models/users/body/edit_profile.dart';
import 'package:attendee_app/models/users/response/edit_profile.dart';

abstract class EditProfileSource {
  Future<EditProfileResponse> editProfile({
    required EditProfileModel payload,
  });
}