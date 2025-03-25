import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/set_forgot_password_abstract.dart';
import 'package:attendee_app/data/source/users/set_forgot_password_abstract.dart';
import 'package:attendee_app/models/users/body/set_forgot_password.dart';
import 'package:attendee_app/models/users/response/set_forgot_password.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetForgotPasswordRepoImpl implements SetForgotPasswordRepo {
  final NetworkInfo set;
  final SetForgotPasswordSource password;

  SetForgotPasswordRepoImpl({required Ref ref})
      : password = ref.read(setForgotPasswordSourceProvider),
        set = ref.read(networkInfoProvider);

  @override
        Future<Either<Failure, SetForgotPasswordResponse>> setForgotPassword({
      required SetForgotPasswordModel payload,
  })async{
    ServiceRunner<Failure, SetForgotPasswordResponse> sR = ServiceRunner(set);

    return sR.tryRemoteandCatch(
      call: password.setForgotPassword(payload: payload),
      errorTitle: "Forgot Password Not Set"
    );
  }
}