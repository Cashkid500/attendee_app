// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCalendarResponse _$GetCalendarResponseFromJson(Map<String, dynamic> json) =>
    GetCalendarResponse(
      status: json['status'] as bool?,
      text: json['text'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      time: json['time'] as String?,
      method: json['method'] as String?,
      endpoint: json['endpoint'] as String?,
    );

Map<String, dynamic> _$GetCalendarResponseToJson(
        GetCalendarResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      status: json['status'] as String?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
