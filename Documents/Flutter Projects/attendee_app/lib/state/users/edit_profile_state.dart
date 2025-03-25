import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/models/users/response/edit_profile.dart';

class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileFailure extends EditProfileState {
  final Failure failure;
  EditProfileFailure({required this.failure});
}

class EditProfileSuccess extends EditProfileState {
  final EditProfileResponse responseData;
  EditProfileSuccess({required this.responseData});
}
