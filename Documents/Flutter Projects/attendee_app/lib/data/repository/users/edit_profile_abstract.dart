import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/body/edit_profile.dart';
import 'package:attendee_app/models/users/response/edit_profile.dart';
import 'package:dartz/dartz.dart';

abstract class EditProfileRepo{
  Future<Either<Failure, EditProfileResponse>> editProfile({
     required EditProfileModel payload,
  });
}