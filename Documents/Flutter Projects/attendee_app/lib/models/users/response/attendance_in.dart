import 'package:json_annotation/json_annotation.dart';


part 'attendance_in.g.dart';

@JsonSerializable()
class AttendanceInResponse {
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "text")
    bool? text;
    @JsonKey(name: "data")
    List<dynamic>? data;
    @JsonKey(name: "time")
    String? time;
    @JsonKey(name: "method")
    String? method;
    @JsonKey(name: "endpoint")
    String? endpoint;
    // @JsonKey(name: "error")
    // List<dynamic>? error;

    AttendanceInResponse({
        this.status,
        this.text,
        this.data,
        this.time,
        this.method,
        this.endpoint,
        // this.error,
    });

    factory AttendanceInResponse.fromJson(Map<String, dynamic> json) => _$AttendanceInResponseFromJson(json);

    Map<String, dynamic> toJson() => _$AttendanceInResponseToJson(this);
}
