// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_out.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceOutResponse _$AttendanceOutResponseFromJson(
        Map<String, dynamic> json) =>
    AttendanceOutResponse(
      status: json['status'] as bool?,
      text: json['text'] as bool?,
      data: json['data'] as List<dynamic>?,
      time: json['time'] as String?,
      method: json['method'] as String?,
      endpoint: json['endpoint'] as String?,
    );

Map<String, dynamic> _$AttendanceOutResponseToJson(
        AttendanceOutResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
    };
