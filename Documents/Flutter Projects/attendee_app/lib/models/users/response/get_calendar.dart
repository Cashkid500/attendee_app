import 'package:attendee_app/models/users/body/get_calendar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_calendar.g.dart';

@JsonSerializable()
class GetCalendarResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "text")
  String? text;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "method")
  String? method;
  @JsonKey(name: "endpoint")
  String? endpoint;
  // @JsonKey(name: "error")
  // List<dynamic>? error;

  GetCalendarResponse({
    this.status,
    this.text,
    this.data,
    this.time,
    this.method,
    this.endpoint,
    // this.error,
  });

  factory GetCalendarResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCalendarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCalendarResponseToJson(this);

  getCalendar({required GetCalendarModel payload}) {}
}

@JsonSerializable()
class Data {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  Map<String, int>? data;

  Data({
    this.status,
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
