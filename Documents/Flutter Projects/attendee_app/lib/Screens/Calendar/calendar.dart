import 'package:attendee_app/Screens/Login/login.dart';
import 'package:attendee_app/Screens/Navigation/navigation.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/get_calendar.dart';
import 'package:attendee_app/models/users/response/get_calendar.dart';
import 'package:attendee_app/providers/state_provider/users/get_calendar_provider.dart';
import 'package:attendee_app/state/users/get_calendar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  void handleGetCalendar() {
    GetCalendarModel data = GetCalendarModel(userid: '');
    ref.read(getCalendarNotifierProvider.notifier).getCalendar(payload: data);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleGetCalendar();
    });
    super.initState();
  }

  GetCalendarResponse responseData = GetCalendarResponse();
  @override
  @override
  Widget build(BuildContext context) {
    final getCalendarState = ref.watch(getCalendarNotifierProvider);
    if (getCalendarState is GetCalendarSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(getCalendarNotifierProvider.notifier).resetstate();
        responseData = getCalendarState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: AttendeeTexts.confirmChangesSuccessful);
      });
    }
    if (getCalendarState is GetCalendarFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(getCalendarNotifierProvider.notifier).resetstate();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: getCalendarState.failure.message);
      });
    }

    return Scaffold(
      backgroundColor: cannonBarrel,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 25.sp),
            child: Column(
              children: [
                // if (getCalendarState is GetCalendarLoading)
                //   const Center(child: CircularProgressIndicator())
                // else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>const
                                  NavigationScreen()));
                        },
                        child: Icon(
                          Icons.west,
                          size: 30.sp,
                          color: whiteText,
                        ),
                      ),
                      Text(
                        AttendeeTexts.calandarHistory,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: whiteText,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: Fonts.serif),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>const
                                  NavigationScreen()));
                        },
                        child: Icon(
                          Icons.home,
                          size: 30.sp,
                          color: whiteText,
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 35.sp,
                ),
                Center(
                  child: Container(
                    width: 330.sp,
                    decoration: BoxDecoration(
                        color: whiteText,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.sp,
                        ),
                        TableCalendar(
                          headerVisible: true,
                          daysOfWeekVisible: true,
                          pageAnimationEnabled: true,
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AttendeeTexts.clockIn,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      AttendeeTexts.clockOut,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AttendeeTexts.todaydate,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                    Text(
                      AttendeeTexts.resumptionHour,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                    Text(
                      AttendeeTexts.closingHour,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AttendeeTexts.yesterdaydate,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                    Text(
                      AttendeeTexts.resumptionHour,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                    Text(
                      AttendeeTexts.closingHour,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.sp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
