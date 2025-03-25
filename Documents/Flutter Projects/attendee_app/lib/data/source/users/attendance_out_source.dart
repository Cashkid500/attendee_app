import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/attendance_out_abstract.dart';
import 'package:attendee_app/models/users/body/attendance_out.dart';
import 'package:attendee_app/models/users/response/attendance_out.dart';
import 'package:attendee_app/services/auth_manager/auth_manager.dart';

class AttendanceOutSourceImpl implements AttendanceOut { 
 final NetworkRequest networkRequest;
 final NetworkRetry networkRetry;

 AttendanceOutSourceImpl(
  {
    required this.networkRequest,
    required this.networkRetry,
  }
 );
  @override
  Future<AttendanceOutResponse> attendanceOut({required AttendanceOutModel value})async {
  String url = AppEndpoints.attendanceout;
    final body = {

      "mac_address" : value.macAddress,
      "longitude" : value.longitude,
      "latitude" : value.latitude,
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
    ),
    );
    log(response.body);
     final data = await json.decode(response.body);
    if(response.statusCode == 200){
      try{
        final AttendanceOutResponse response = AttendanceOutResponse.fromJson(data);
        return response;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final AttendanceOutResponse response = AttendanceOutResponse.fromJson(data);
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