import 'package:json_annotation/json_annotation.dart';


part 'attendance_out.g.dart';

@JsonSerializable()
class AttendanceOutResponse {
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

    AttendanceOutResponse({
        this.status,
        this.text,
        this.data,
        this.time,
        this.method,
        this.endpoint,
        // this.error,
    });

    factory AttendanceOutResponse.fromJson(Map<String, dynamic> json) => _$AttendanceOutResponseFromJson(json);

    Map<String, dynamic> toJson() => _$AttendanceOutResponseToJson(this);
}
