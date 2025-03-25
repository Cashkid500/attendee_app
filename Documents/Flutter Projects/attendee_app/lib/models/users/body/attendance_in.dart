import 'dart:ffi';

class AttendanceInModel{

  final int macAddress;
  final double latitude;
  final double longitude;

   AttendanceInModel({
    required this.macAddress,
    required this.latitude,
    required this.longitude,
   });
}