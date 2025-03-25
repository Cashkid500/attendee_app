import 'dart:convert';
import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/set_forgot_password_abstract.dart';
import 'package:attendee_app/models/users/body/set_forgot_password.dart';
import 'package:attendee_app/models/users/response/set_forgot_password.dart';

class SetForgotPasswordSourceImpl implements SetForgotPasswordSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  SetForgotPasswordSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<SetForgotPasswordResponse> setForgotPassword(
      {required SetForgotPasswordModel payload}) async {
    String url = AppEndpoints.setForgotPassword;
    final body = {
      "email": payload.email,
      "new_password": payload.newPassword,
      "confirm_new_password": payload.confirmNewPassword,
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
    final data = await json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        final SetForgotPasswordResponse responseModel =
            SetForgotPasswordResponse.fromJson(data);
        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final SetForgotPasswordResponse responseModel =
          SetForgotPasswordResponse.fromJson(data);
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