import 'package:attendee_app/core/failures/failures.dart';
import 'package:attendee_app/core/network/network_info.dart';
import 'package:attendee_app/core/runner/service.dart';
import 'package:attendee_app/data/repository/users/edit_profile_abstract.dart';
import 'package:attendee_app/data/source/users/edit_profile_abstract.dart';
import 'package:attendee_app/models/users/body/edit_profile.dart';
import 'package:attendee_app/models/users/response/edit_profile.dart';
import 'package:attendee_app/providers/network_provider.dart';
import 'package:attendee_app/providers/source_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final NetworkInfo netinfo;
  final EditProfileSource fetch;
  EditProfileRepoImpl({required Ref ref})
      : fetch = ref.read(editProfileSourceImplProvider),
        netinfo = ref.read(networkInfoProvider);

  @override
  Future<Either<Failure, EditProfileResponse>> editProfile({
    required EditProfileModel payload,
  }) async {
    ServiceRunner<Failure, EditProfileResponse> sR = ServiceRunner(netinfo);

    return sR.tryRemoteandCatch(
        call: fetch.editProfile(payload: payload),
        errorTitle: "Error, unable to take Attendance,");
  }
}
