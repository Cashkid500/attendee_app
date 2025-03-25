import 'package:json_annotation/json_annotation.dart';

part 'fetch_notification.g.dart';

@JsonSerializable()
class FetchNotificationResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  List<dynamic>? data;

  FetchNotificationResponse({
    this.status,
    this.data,
  });

  factory FetchNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchNotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FetchNotificationResponseToJson(this);
}
