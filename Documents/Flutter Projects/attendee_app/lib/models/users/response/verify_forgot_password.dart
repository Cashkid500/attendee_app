import 'package:json_annotation/json_annotation.dart';

part 'verify_forgot_password.g.dart';

@JsonSerializable()
class VerifyForgotPasswordResponse {
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

    VerifyForgotPasswordResponse({
        this.status,
        this.text,
        this.data,
        this.time,
        this.method,
        this.endpoint,
        // this.error,
    });

    factory VerifyForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$VerifyForgotPasswordResponseFromJson(json);

    Map<String, dynamic> toJson() => _$VerifyForgotPasswordResponseToJson(this);
}
