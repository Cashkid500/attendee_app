import 'dart:convert';
import 'dart:developer';
import 'package:attendee_app/constants/app_api_endpoint.dart';
import 'package:attendee_app/core/network/network_request.dart';
import 'package:attendee_app/core/network/network_retry.dart';
import 'package:attendee_app/data/source/users/forgot_password_abstract.dart';
import 'package:attendee_app/models/users/body/forgot_password.dart';
import 'package:attendee_app/models/users/response/forgot_password.dart';

class ForgotPasswordSourceImpl implements ForgotPasswordSource {
  final NetworkRequest networkRequest;
  final NetworkRetry networkRetry;

  ForgotPasswordSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  @override
  Future<ForgotPasswordResponse> forgotPassword(
      {required ForgotPasswordModel payload}) async {
    String url = AppEndpoints.forgotPassword;
    final body = {
      "email": payload.email,
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
        final ForgotPasswordResponse responseModel =
            ForgotPasswordResponse.fromJson(data);
        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ForgotPasswordResponse responseModel =
          ForgotPasswordResponse.fromJson(data);
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
