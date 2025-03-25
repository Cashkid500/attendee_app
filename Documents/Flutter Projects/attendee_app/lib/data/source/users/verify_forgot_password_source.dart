import 'dart:convert';
import 'dart:developer';
import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/verify_forgot_password_abstract.dart';
import 'package:attendee_app/models/users/body/verify_forgot_password.dart';
import 'package:attendee_app/models/users/response/verify_forgot_password.dart';

class VerifyForgotPasswordSourceImpl implements VerifyForgotPasswordSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  VerifyForgotPasswordSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<VerifyForgotPasswordResponse> verifyForgotPassword(
      {required VerifyForgotPasswordModel payload}) async {
    String url = AppEndpoints.verifyForgotPassword;
    final body = {
      "email": payload.email,
      "reset_code": payload.resetCode,
    };
    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: json.encode(body),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    log(response.body);
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final VerifyForgotPasswordResponse responseModel =
            VerifyForgotPasswordResponse.fromJson(data);
        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final VerifyForgotPasswordResponse responseModel =
          VerifyForgotPasswordResponse.fromJson(data);
      try {
        if (responseModel.status == false) {
          throw Exception(data['text']);
        } else {
          final errorMessage = data['text'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}
