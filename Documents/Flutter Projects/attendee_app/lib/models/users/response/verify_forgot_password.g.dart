// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_forgot_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyForgotPasswordResponse _$VerifyForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyForgotPasswordResponse(
      status: json['status'] as bool?,
      text: json['text'] as String?,
      data: json['data'] as List<dynamic>?,
      time: json['time'] as String?,
      method: json['method'] as String?,
      endpoint: json['endpoint'] as String?,
    );

Map<String, dynamic> _$VerifyForgotPasswordResponseToJson(
        VerifyForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
    };
