import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/forgot_password_abstract.dart';
import 'package:attendee_app/data/source/users/forgot_password_abstract.dart';
import 'package:attendee_app/models/users/body/forgot_password.dart';
import 'package:attendee_app/models/users/response/forgot_password.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  final NetworkInfo forgot;
  final ForgotPasswordSource password;

  ForgotPasswordRepoImpl({required Ref ref})
      : password = ref.read(forgotPasswordSourceProvider),
        forgot = ref.read(networkInfoProvider);

  @override
        Future<Either<Failure, ForgotPasswordResponse>> forgotPassword({
      required ForgotPasswordModel payload,
  })async{
    ServiceRunner<Failure, ForgotPasswordResponse> sR = ServiceRunner(forgot);

    return sR.tryRemoteandCatch(
      call: password.forgotPassword(payload: payload),
      errorTitle: "Correct Password"
    );
  }
}