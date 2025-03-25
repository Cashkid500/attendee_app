import 'package:json_annotation/json_annotation.dart';

part 'update_password.g.dart';

@JsonSerializable()
class UpdatePasswordResponse {
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "text")
    String? text;
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

    UpdatePasswordResponse({
        this.status,
        this.text,
        this.data,
        this.time,
        this.method,
        this.endpoint,
        // this.error,
    });

    factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) => _$UpdatePasswordResponseFromJson(json);

    Map<String, dynamic> toJson() => _$UpdatePasswordResponseToJson(this);
}
