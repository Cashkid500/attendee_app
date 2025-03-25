import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/edit_profile_abstract.dart';
import 'package:attendee_app/models/users/body/edit_profile.dart';
import 'package:attendee_app/models/users/response/edit_profile.dart';
import 'package:attendee_app/services/auth_manager/auth_manager.dart';

class EditProfileSourceImpl implements EditProfileSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  EditProfileSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<EditProfileResponse> editProfile(
      {required EditProfileModel payload}) async {
    String url = AppEndpoints.editProfile;
    final body = {
      "new_name": payload.newName,
      "new_email": payload.newEmail,
      "new_department": payload.newDepartment,
      "new_description": payload.newDescription,
    };
    String accessToken = AuthManager.instance.userCred?.data.token ?? "";
    print(accessToken);
    final response = await networkRetry.networkRetry(() => networkRequest.post(
          url,
          body: json.encode(body),
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: 'Bearer $accessToken',
          },
        ));
    log(response.body);
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final EditProfileResponse response = EditProfileResponse.fromJson(data);
        return response;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final EditProfileResponse response = EditProfileResponse.fromJson(data);
      try {
        if (response.status == false) {
          throw Exception(data['text']);
        } else {
          final errormessage = data['text'];
          throw Exception(errormessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}
