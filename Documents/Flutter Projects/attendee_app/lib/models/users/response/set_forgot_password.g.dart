// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_forgot_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetForgotPasswordResponse _$SetForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    SetForgotPasswordResponse(
      status: json['status'] as bool?,
      text: json['text'] as String?,
      data: json['data'] as List<dynamic>?,
      time: json['time'] as String?,
      method: json['method'] as String?,
      endpoint: json['endpoint'] as String?,
    );

Map<String, dynamic> _$SetForgotPasswordResponseToJson(
        SetForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
    };
