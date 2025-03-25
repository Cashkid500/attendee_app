import 'dart:async';
import 'dart:developer';
import 'package:attendee_app/Screens/Notification/notification.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/attendance_in.dart';
import 'package:attendee_app/models/users/body/attendance_out.dart';
import 'package:attendee_app/models/users/response/attendance_in.dart';
import 'package:attendee_app/models/users/response/attendance_out.dart';
import 'package:attendee_app/providers/state_provider/users/attendance_provider.dart';
import 'package:attendee_app/state/users/attendance_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mac_address/mac_address.dart';
import 'package:one_clock/one_clock.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

AttendanceInResponse responseData = AttendanceInResponse();
AttendanceOutResponse response = AttendanceOutResponse();

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  String _platformVersion = 'Unknown';
  void _showOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const clockInDialog();
      },
    );
  }
 Future<Position> _determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error(AttendeeTexts.locationDisabled);
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        await Geolocator.openAppSettings();

        if (permission == LocationPermission.denied) {
          return Future.error(AttendeeTexts.locationPermissiondenied);
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            AttendeeTexts.locationPermanentlydenied);
      }
      if (permission == LocationPermission.unableToDetermine) {}
      return await Geolocator.getCurrentPosition();
    }

  void handleAttendanceIn( 
  
) async{
  print(90);
  Position currentPosition = await getCurrentPosition();
    AttendanceInModel data = AttendanceInModel(
      macAddress: 13242366,
      latitude: currentPosition.latitude,
      longitude: currentPosition.longitude,
    );
    ref
        .read(attendanceInStateNotifierProvider.notifier)
        .attendanceIn(value: data);
  }

  
  
  void handleAttendanceOut(
    
  ) async{
    Position currentPosition = await getCurrentPosition();
    AttendanceOutModel data = AttendanceOutModel(
      macAddress: 13242366,
      latitude: currentPosition.latitude,
      longitude: currentPosition.longitude,
    );
    ref
        .read(attendanceOutStateNotifierProvider.notifier)
        .attendanceOut(value: data);
  }

  
Future<Position> getCurrentPosition() async{
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
 return position;
}
Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }




  @override
  Widget build(BuildContext context) {
   final attendanceInstate = ref.watch(attendanceInStateNotifierProvider);
    log(attendanceInstate.runtimeType.toString());

   
if (attendanceInstate is AttendanceInSuccess){
   WidgetsBinding.instance.addPostFrameCallback((_) {
   AppSnackbar errorToast = AppSnackbar(context);
    errorToast.showToast(text: AttendeeTexts.clockInMessage);
    responseData = attendanceInstate.responseData;
    
   });
}
if (attendanceInstate is AttendanceInFailure){
   WidgetsBinding.instance.addPostFrameCallback((_) {
   AppSnackbar errorToast = AppSnackbar(context, isError: true);
    errorToast.showToast(text: AttendeeTexts.clockInfailed);

   });
}


 final attendanceOutstate = ref.watch(attendanceOutStateNotifierProvider);
    log(attendanceOutstate.runtimeType.toString());

if (attendanceOutstate is AttendanceOutSuccess){
   WidgetsBinding.instance.addPostFrameCallback((_) {
   AppSnackbar errorToast = AppSnackbar(context);
    errorToast.showToast(text: AttendeeTexts.clockOutMessage);

   });
}

if (attendanceOutstate is AttendanceOutFailure){
   WidgetsBinding.instance.addPostFrameCallback((_) {
   AppSnackbar errorToast = AppSnackbar(context, isError: true);
    errorToast.showToast(text: AttendeeTexts.clockOutfailed);

   });
}

    return Scaffold(
      backgroundColor: cannonBarrel,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: const AssetImage(ImagesPath.avatar),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const NotificationScreen()));
              },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.sp),
                      child: Icon(
                        Icons.notifications_none,
                        color: whiteText,
                        size: 40.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.sp,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Row(
                    children: [
                      Text(
                        AttendeeTexts.welcome,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: whiteText,
                        ),
                      ),
                      Text(
                        AttendeeTexts.user,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          color: whiteText,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100.sp),
                  child: Text(
                    AttendeeTexts.company,
                    style: TextStyle(
                      fontFamily: Fonts.serif,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      color: whiteText,
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 150.sp,),
            
            // Digital Clock
            Center(
              child: DigitalClock(
              showSeconds: false,
              isLive: true,
              textScaleFactor: 3.5.sp,
              digitalClockTextColor: Colors.white,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(5))),
                datetime: DateTime.now()),
            ),
            SizedBox(
              height: 150.sp,
            ),

            // Clock In and Clock Out Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _showOrderDialog(context);
                  },
                  
                  // Clock In Button
                  child: Container(
                    height: 44.sp,
                    width: 108.sp,
                    decoration: BoxDecoration(
                      color: walledGarden,
                      borderRadius: BorderRadius.circular(7.sp),
                    ),
                    child: Center(
                      child: Text(
                        AttendeeTexts.clockIn,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: blackText,
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Clock Out Button
                GestureDetector(
                  onTap: () {
                    clockOutAlert(context);
                  },
                  child: Container(
                    height: 44.sp,
                    width: 118.sp,
                    decoration: BoxDecoration(
                      color: chilledChilly,
                      borderRadius: BorderRadius.circular(7.sp),
                      ),
                    child: Center(
                      child: Text(
                        AttendeeTexts.clockOut,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: blackText,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.sp,
            ),
          ],
        ),
      ),
    );
  }


  Future<dynamic> clockOutAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: whiteText,
          title: Text(
            AttendeeTexts.confirm,
            style: TextStyle(
              fontFamily: Fonts.serif,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: blackText,
            ),
          ),
          content: Container(
            height: 145.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AttendeeTexts.checkConfirmation,
                  style: TextStyle(
                    fontFamily: Fonts.serif,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: blackText,
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  AttendeeTexts.workplaceConfirmation,
                  style: TextStyle(
                    fontFamily: Fonts.serif,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: blackText,
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                if(AttendanceInState is AttendanceInLoading)
                const CircularProgressIndicator()
                else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 50.sp,
                      width: 100.sp,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your action for Cancel here
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          AttendeeTexts.cancel,
                          style: TextStyle(
                            fontFamily: Fonts.serif,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: chilledChilly,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.sp,
                      width: 100.sp,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your action for Order Now here
                          Navigator.of(context).pop();
                          
                          // ShowDialog Box  
                           showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: whiteText,
                            title:const Text(""),
                            content: Container(
                              height: 30.sp,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30.sp),
                                    child: Text(
                                      AttendeeTexts.clockOutMessage,
                                      style: TextStyle(
                                        fontFamily: Fonts.serif,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14.sp,
                                        color: blackText,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(right: 30.sp),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: walledGarden,
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.sp),
                                child: Container(
                                  height: 59.sp,
                                  width: 153.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(43.r),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                     Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          AttendeeTexts.backHome,
                                          style: TextStyle(
                                            fontFamily: Fonts.serif,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: blackText,
                                          ),
                                        ),
                                        Expanded(
                                            child: Icon(
                                          Icons.home,
                                          color: blackText,
                                          size: 30.sp,
                                        )),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: shimmeringBlue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                        },
                        child: GestureDetector(
                          onTap:() {
                            handleAttendanceOut();
                          },
                          child: Text(
                            AttendeeTexts.confirm2,
                            style: TextStyle(
                              fontFamily: Fonts.serif,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w900,
                              color: whiteText,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: walledGarden,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class clockInDialog extends ConsumerStatefulWidget {
  const clockInDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<clockInDialog> createState() => _clockInDialogScreenState();
}


class _clockInDialogScreenState extends ConsumerState<clockInDialog> {

Future<Position> getCurrentPosition() async{

  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
 return position;
}
   Future<Position> determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error(AttendeeTexts.locationDisabled);
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        await Geolocator.openAppSettings();

        if (permission == LocationPermission.denied) {
          return Future.error(AttendeeTexts.locationPermissiondenied);
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            AttendeeTexts.locationPermanentlydenied);
      }
      if (permission == LocationPermission.unableToDetermine) {}
      return await Geolocator.getCurrentPosition();
    }

  void handleAttendanceIn() async{
  print(90);
  Position currentPosition = await determinePosition();
    AttendanceInModel data = AttendanceInModel(
      macAddress: 13242366,
      latitude: currentPosition.latitude,
      longitude: currentPosition.longitude,
    );
    ref
        .read(attendanceInStateNotifierProvider.notifier)
        .attendanceIn(value: data);
  }

  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteText,
      title: Text(
        AttendeeTexts.confirm,
        style: TextStyle(
          fontFamily: Fonts.serif,
          fontSize: 18.sp,
          fontWeight: FontWeight.w800,
          color: blackText,
        ),
      ),
      content: Container(
        height: 145.sp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AttendeeTexts.checkConfirmation,
              style: TextStyle(
                fontFamily: Fonts.serif,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                color: blackText,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              AttendeeTexts.workplaceConfirmation,
              style: TextStyle(
                fontFamily: Fonts.serif,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: blackText,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 50.sp,
                  width: 100.sp,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your action for Cancel here
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AttendeeTexts.cancel,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: chilledChilly,
                    ),
                  ),
                ),
                Container(
                  height: 50.sp,
                  width: 100.sp,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your action for Order Now here
                      Navigator.of(context).pop();
                      
                      // ShowDialog Box
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: whiteText,
                            title:const Text(""),
                            content: Container(
                              height: 30.sp,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 30.sp),
                                    child: Text(
                                      AttendeeTexts.clockInMessage,
                                      style: TextStyle(
                                        fontFamily: Fonts.serif,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14.sp,
                                        color: blackText,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(right: 30.sp),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: walledGarden,
                                    ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.sp),
                                child: Container(
                                  height: 59.sp,
                                  width: 153.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(43.r),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                     Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          AttendeeTexts.backHome,
                                          style: TextStyle(
                                            fontFamily: Fonts.serif,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: blackText,
                                          ),
                                        ),
                                        Expanded(
                                            child: Icon(
                                          Icons.home,
                                          color: blackText,
                                          size: 30.sp,
                                        )),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: shimmeringBlue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                         handleAttendanceIn();
                      },
                      child: Text(
                        AttendeeTexts.confirm2,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w900,
                          color: whiteText,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: walledGarden,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
