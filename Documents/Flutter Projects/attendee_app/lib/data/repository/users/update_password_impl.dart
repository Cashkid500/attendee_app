import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/update_password_abstract.dart';
import 'package:attendee_app/data/source/users/update_password_abstract.dart';
import 'package:attendee_app/models/users/body/update_password.dart';
import 'package:attendee_app/models/users/response/update_password.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatePasswordRepoImpl implements UpdatePasswordRepo {
  final NetworkInfo update;
  final UpdatePasswordSource password;

  UpdatePasswordRepoImpl({required Ref ref})
      : password = ref.read(updatePasswordSourceProvider),
        update = ref.read(networkInfoProvider);

  @override
        Future<Either<Failure, UpdatePasswordResponse>> updatePassword({
      required UpdatePasswordModel payload,
  })async{
    ServiceRunner<Failure, UpdatePasswordResponse> sR = ServiceRunner(update);

    return sR.tryRemoteandCatch(
      call: password.updatePassword(payload: payload),
      errorTitle: "Password Not Updated"
    );
  }
}