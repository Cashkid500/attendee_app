import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';


@HiveType(typeId: 1)
@JsonSerializable()
class LoginResponse {
  @HiveField(1)
  @JsonKey(name: "status")
  bool status;
  @HiveField(3)
  @JsonKey(name: "text")
  String text;
  @HiveField(5)
  @JsonKey(name: "data")
  Data data;
  @HiveField(7)
  @JsonKey(name: "time")
  String time;
  @HiveField(9)
  @JsonKey(name: "method")
  String method;
  @HiveField(11)
  @JsonKey(name: "endpoint")
  String endpoint;
  @HiveField(13)
  // @JsonKey(name: "error")
  // List<dynamic> error;

  LoginResponse({
    required this.status,
    required this.text,
    required this.data,
    required this.time,
    required this.method,
    required this.endpoint,
    // required this.error,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Data {
  @HiveField(1)
  @JsonKey(name: "token")
  String token;

  Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
