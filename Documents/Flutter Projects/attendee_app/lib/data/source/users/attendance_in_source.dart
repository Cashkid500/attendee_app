import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/attendance_in_abstract.dart';
import 'package:attendee_app/models/users/body/attendance_in.dart';
import 'package:attendee_app/models/users/response/attendance_in.dart';
import 'package:attendee_app/services/auth_manager/auth_manager.dart';

class AttendanceInSourceImpl implements AttendanceIn { 
 final NetworkRequest networkRequest;
 final NetworkRetry networkRetry;

 AttendanceInSourceImpl(
  {
    required this.networkRequest,
    required this.networkRetry,
  }
 );
  @override
  Future<AttendanceInResponse> attendanceIn({required AttendanceInModel value})async {
  String url = AppEndpoints.attendancein;
    final body = {
      "mac_address" : value.macAddress,
      "longitude" : value.longitude,
      "latitude" : value.latitude,
    };
    String accessToken = AuthManager.instance.userCred?.data.token ?? "";
    print(accessToken);
    log(body.toString());
    final response = await networkRetry.networkRetry(() => networkRequest.post(
      url,
      body: json.encode(body),
    headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        },
    ));
    log(response.body);
    print(response.body);
     final data = await json.decode(response.body);
     print(response.statusCode);
    if(response.statusCode == 200){
      try{
        final AttendanceInResponse response = AttendanceInResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final AttendanceInResponse response = AttendanceInResponse.fromJson(data);
      try {
        if (response.status == false){
          throw Exception(data ['text']);
        }else {
          final errormessage = data['text'];
          throw Exception(errormessage);

        }
      }on Exception catch (_){
        rethrow;
      }
  }
}
}