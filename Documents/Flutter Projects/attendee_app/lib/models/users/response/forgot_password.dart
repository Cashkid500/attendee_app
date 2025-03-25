import 'package:json_annotation/json_annotation.dart';

part 'forgot_password.g.dart';

@JsonSerializable()
class ForgotPasswordResponse {
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

    ForgotPasswordResponse({
        this.status,
        this.text,
        this.data,
        this.time,
        this.method,
        this.endpoint,
        // this.error,
    });

    factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}
