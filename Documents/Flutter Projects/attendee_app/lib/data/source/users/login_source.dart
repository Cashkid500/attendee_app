import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/login_abstract.dart';
import 'package:attendee_app/models/users/body/login.dart';
import 'package:attendee_app/models/users/response/login.dart';
import 'package:attendee_app/models/users/response/loginfailure.dart';
import 'package:attendee_app/services/auth_manager/auth_manager.dart';

class LoginSourceImpl implements Login { 
 final NetworkRequest networkRequest;
 final NetworkRetry networkRetry;

 LoginSourceImpl(
  {
    required this.networkRequest,
    required this.networkRetry,
  }
 );

  @override
  Future<LoginResponse> login({required LoginModel value})async {
  String url = AppEndpoints.login;
    final body = {
      "email" : value.email,
      "password" : value.password,
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
     print(response.statusCode);
    if(response.statusCode == 200){
      try{
        final LoginResponse responseModel = LoginResponse.fromJson(data);
        return responseModel;
      }on Exception catch(_){
        rethrow;
      }

    }else {
      final Loginfailure responseModel = Loginfailure.fromJson(data);
      try {
        if (responseModel.status == false){
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