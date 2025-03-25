// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceInResponse _$AttendanceInResponseFromJson(
        Map<String, dynamic> json) =>
    AttendanceInResponse(
      status: json['status'] as bool?,
      text: json['text'] as bool?,
      data: json['data'] as List<dynamic>?,
      time: json['time'] as String?,
      method: json['method'] as String?,
      endpoint: json['endpoint'] as String?,
    );

Map<String, dynamic> _$AttendanceInResponseToJson(
        AttendanceInResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
    };
