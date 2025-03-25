// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchNotificationResponse _$FetchNotificationResponseFromJson(
        Map<String, dynamic> json) =>
    FetchNotificationResponse(
      status: json['status'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$FetchNotificationResponseToJson(
        FetchNotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
