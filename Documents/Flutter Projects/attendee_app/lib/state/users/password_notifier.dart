import 'package:attendee_app/data/repository/users/forgot_password_abstract.dart';
import 'package:attendee_app/data/repository/users/set_forgot_password_abstract.dart';
import 'package:attendee_app/data/repository/users/update_password_abstract.dart';
import 'package:attendee_app/data/repository/users/verify_forgot_password_abstract.dart';
import 'package:attendee_app/models/users/body/forgot_password.dart';
import 'package:attendee_app/models/users/body/set_forgot_password.dart';
import 'package:attendee_app/models/users/body/update_password.dart';
import 'package:attendee_app/models/users/body/verify_forgot_password.dart';
import 'package:attendee_app/providers/repo_provider.dart';
import 'package:attendee_app/state/users/password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

  // Forgot Password
  class ForgotPasswordStateNotifier extends StateNotifier<ForgotPasswordState> {
  final  ForgotPasswordRepo _forgotPasswordRepository;

  ForgotPasswordStateNotifier(Ref ref)
      : _forgotPasswordRepository = ref.read(forgotPasswordRepositoryProvider),
        super(ForgotPasswordInitial());

  Future<void> forgotPassword({
    required ForgotPasswordModel payload,
  }) async {
    state = ForgotPasswordLoading();

    final userTransactionListOrError =
        await _forgotPasswordRepository.forgotPassword(payload: payload);
    print(userTransactionListOrError.all);
    state = userTransactionListOrError.fold(
      (l) => ForgotPasswordFailure(failure:l,),
      (r) => ForgotPasswordSuccess(responseData:r),
    );

    if (state is ForgotPasswordFailure) {
      final failureState = state as ForgotPasswordFailure;

    } else if (state is ForgotPasswordSuccess) {

    }
  }
  void resetState() {
    state = ForgotPasswordInitial();
  }
}

// Set Forgot Password
class SetForgotPasswordStateNotifier extends StateNotifier<SetForgotPasswordState> {
  final  SetForgotPasswordRepo _setForgotPasswordRepository;

  SetForgotPasswordStateNotifier(Ref ref)
      : _setForgotPasswordRepository = ref.read(setForgotPasswordRepositoryProvider),
        super(SetForgotPasswordInitial());

  Future<void> setForgotPassword({
    required SetForgotPasswordModel payload,
  }) async {
    state = SetForgotPasswordLoading();

    final userTransactionListOrError =
        await _setForgotPasswordRepository.setForgotPassword(payload: payload);

    state = userTransactionListOrError.fold(
      (l) => SetForgotPasswordFailure(failure:l,),
      (r) => SetForgotPasswordSuccess(responseData:r),
    );

    if (state is SetForgotPasswordFailure) {
      final failureState = state as SetForgotPasswordFailure;

    } else if (state is SetForgotPasswordSuccess) {

    }
  }
  void resetState() {
    state = SetForgotPasswordInitial();
  }
}
 
  // Verify Forgot Password
class VerifyForgotPasswordStateNotifier extends StateNotifier<VerifyForgotPasswordState> {
  final  VerifyForgotPasswordRepo _verifyForgotPasswordRepository;

  VerifyForgotPasswordStateNotifier(Ref ref)
      : _verifyForgotPasswordRepository = ref.read(verifyForgotPasswordRepositoryProvider),
        super(VerifyForgotPasswordInitial());

  Future<void> verifyForgotPassword({
    required VerifyForgotPasswordModel payload,
  }) async {
    state = VerifyForgotPasswordLoading();

    final userTransactionListOrError =
        await _verifyForgotPasswordRepository.verifyForgotPassword(payload: payload);

    state = userTransactionListOrError.fold(
      (l) => VerifyForgotPasswordFailure(failure:l,),
      (r) => VerifyForgotPasswordSuccess(responseData:r),
    );

    if (state is VerifyForgotPasswordFailure) {
      final failureState = state as VerifyForgotPasswordFailure;

    } else if (state is VerifyForgotPasswordSuccess) {

    }
  }
  void resetState() {
    state = VerifyForgotPasswordInitial();
  }
}

  // Update Password
  class UpdatePasswordStateNotifier extends StateNotifier<UpdatePasswordState> {
  final  UpdatePasswordRepo _updatePasswordRepository;

  UpdatePasswordStateNotifier(Ref ref)
      : _updatePasswordRepository = ref.read(updatePasswordRepositoryProvider),
        super(UpdatePasswordInitial());

  Future<void> updatePassword({
    required UpdatePasswordModel payload,
  }) async {
    state = UpdatePasswordLoading();

    final userTransactionListOrError =
        await _updatePasswordRepository.updatePassword(payload: payload);

    state = userTransactionListOrError.fold(
      (l) => UpdatePasswordFailure(failure:l,),
      (r) => UpdatePasswordSuccess(responseData:r),
    );

    if (state is UpdatePasswordFailure) {
      final failureState = state as UpdatePasswordFailure;

    } else if (state is UpdatePasswordSuccess) {

    }
  }
  void resetState() {
    state = UpdatePasswordInitial();
  }
}