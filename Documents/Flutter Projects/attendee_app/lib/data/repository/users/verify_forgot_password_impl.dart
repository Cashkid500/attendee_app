import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/verify_forgot_password_abstract.dart';
import 'package:attendee_app/data/source/users/verify_forgot_password_abstract.dart';
import 'package:attendee_app/models/users/body/verify_forgot_password.dart';
import 'package:attendee_app/models/users/response/verify_forgot_password.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyForgotPasswordRepoImpl implements VerifyForgotPasswordRepo {
  final NetworkInfo verify;
  final VerifyForgotPasswordSource password;

  VerifyForgotPasswordRepoImpl({required Ref ref})
      : password = ref.read(verifyForgotPasswordSourceProvider),
        verify = ref.read(networkInfoProvider);

  @override
        Future<Either<Failure, VerifyForgotPasswordResponse>> verifyForgotPassword({
      required VerifyForgotPasswordModel payload,
  })async{
    ServiceRunner<Failure, VerifyForgotPasswordResponse> sR = ServiceRunner(verify);

    return sR.tryRemoteandCatch(
      call: password.verifyForgotPassword(payload: payload),
      errorTitle: "Forgot Password Not Verified"
    );
  }
}