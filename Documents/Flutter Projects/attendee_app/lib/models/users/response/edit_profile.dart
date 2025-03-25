import 'package:json_annotation/json_annotation.dart';

part 'edit_profile.g.dart';

@JsonSerializable()
class EditProfileResponse {
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

  EditProfileResponse({
    this.status,
    this.text,
    this.data,
    this.time,
    this.method,
    this.endpoint,
    // this.error,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseToJson(this);
}
