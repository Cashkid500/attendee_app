import 'dart:ffi';

class AttendanceOutModel{

  final int macAddress;
  final double latitude;
  final double longitude;

   AttendanceOutModel({

    required this.macAddress,
    required this.latitude,
    required this.longitude,
   });
}