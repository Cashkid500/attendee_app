// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginfailure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginfailure _$LoginfailureFromJson(Map<String, dynamic> json) => Loginfailure(
      status: json['status'] as bool?,
      text: json['text'] as String?,
      data: json['data'],
      time: json['time'] as String?,
      method: json['method'] as String?,
      endpoint: json['endpoint'] as String?,
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginfailureToJson(Loginfailure instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
      'error': instance.error,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: json['code'] as int?,
      text: json['text'] as String?,
      link: json['link'] as String?,
      hint: (json['hint'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'text': instance.text,
      'link': instance.link,
      'hint': instance.hint,
    };
