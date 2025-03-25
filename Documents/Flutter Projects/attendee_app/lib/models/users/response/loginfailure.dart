import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'loginfailure.g.dart';

@JsonSerializable()
class Loginfailure {
    @JsonKey(name: "status")
    bool? status;
    @JsonKey(name: "text")
    String? text;
    @JsonKey(name: "data")
    dynamic data;
    @JsonKey(name: "time")
    String? time;
    @JsonKey(name: "method")
    String? method;
    @JsonKey(name: "endpoint")
    String? endpoint;
    @JsonKey(name: "error")
    Error? error;

    Loginfailure({
        this.status,
        this.text,
        this.data,
        this.time,
        this.method,
        this.endpoint,
        this.error,
    });

    factory Loginfailure.fromJson(Map<String, dynamic> json) => _$LoginfailureFromJson(json);

    Map<String, dynamic> toJson() => _$LoginfailureToJson(this);
}

@JsonSerializable()
class Error {
    @JsonKey(name: "code")
    int? code;
    @JsonKey(name: "text")
    String? text;
    @JsonKey(name: "link")
    String? link;
    @JsonKey(name: "hint")
    List<String>? hint;

    Error({
        this.code,
        this.text,
        this.link,
        this.hint,
    });

    factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

    Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
