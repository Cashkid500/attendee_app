import 'package:attendee_app/Screens/Navigation/navigation.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/fetch_notification.dart';
import 'package:attendee_app/models/users/response/fetch_notification.dart';
import 'package:attendee_app/providers/state_provider/users/fetch_notification_provider.dart';
import 'package:attendee_app/state/users/fetch_notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationScreen> createState() => FetchNotificationState();
}

List texts = [AttendeeTexts.today, AttendeeTexts.today, AttendeeTexts.today];
Future<void> refreshNotifications(context) async {
  context.refresh(fetchNotificationNotifierProvider.notifier);
}

FetchNotificationResponse responseData = FetchNotificationResponse();

class FetchNotificationState extends ConsumerState<NotificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleAttendanceIn();
    });
    super.initState();
  }

  void handleAttendanceIn() async {
    FetchNotificationModel data = FetchNotificationModel(
      startDate: "2023-11-01",
      endDate: "2023-11-13",
    );
    ref
        .read(fetchNotificationNotifierProvider.notifier)
        .fetchNotification(payload: data);
  }

  @override
  Widget build(BuildContext context) {
    // final fetchNotificationRepositoryProvider =
    //     FutureProvider.autoDispose((ref) async {});
    final fetchNotificationState = ref.watch(fetchNotificationNotifierProvider);
    if (fetchNotificationState is FetchNotificationSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(fetchNotificationNotifierProvider.notifier).resetstate();
        responseData = fetchNotificationState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: AttendeeTexts.confirmChangesSuccessful);
      });
    }
    if (fetchNotificationState is FetchNotificationFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(fetchNotificationNotifierProvider.notifier).resetstate();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: fetchNotificationState.failure.message);
      });
    }

    return Scaffold(
      backgroundColor: blackText,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (fetchNotificationState is FetchNotificationLoading)
            //   for (var x in [1, 2, 3])
            //     const Center(child: CircularProgressIndicator())
            // else
              Padding(
                padding: EdgeInsets.only(top: 40.sp, left: 20.sp, right: 20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const
                                NavigationScreen()));
                      },
                      child: Icon(
                        Icons.west,
                        color: whiteText,
                        size: 30.sp,
                      ),
                    ),
                    SizedBox(
                      width: 70.sp,
                    ),
                    Text(
                      AttendeeTexts.notification,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 30.sp),
            const Day(dayspath: AttendeeTexts.today),
            SizedBox(
              height: 15.sp,
            ),
            // Day(dayspath: texts[2]),
            // for (var x in texts) Day(dayspath: x),
            const ClockedIn(timeinPath: AttendeeTexts.twelveHours),
            SizedBox(
              height: 20.sp,
            ),
            const ClockedOut(timeoutPath: AttendeeTexts.justNow),
            SizedBox(
              height: 30.sp,
              width: 430.sp,
              child: Divider(
                color: germanGrey,
                thickness: 4.sp,
              ),
            ),
            const Day(dayspath: AttendeeTexts.yesterday),
            SizedBox(
              height: 15.sp,
            ),
            const ClockedIn(timeinPath: AttendeeTexts.twentyFourHours),
            SizedBox(
              height: 20.sp,
            ),
            const ClockedOut(timeoutPath: AttendeeTexts.twentyFourHours),
            SizedBox(
              height: 30.sp,
              width: 430.sp,
              child: Divider(
                color: germanGrey,
                thickness: 4.sp,
              ),
            ),
            const Day(dayspath: AttendeeTexts.thisWeek),
            SizedBox(
              height: 15.sp,
            ),
            const ClockedIn(timeinPath: AttendeeTexts.twentyFourHours),
            SizedBox(
              height: 20.sp,
            ),
            const ClockedOut(timeoutPath: AttendeeTexts.twentyFourHours),
            SizedBox(height: 20.sp),
            const ClockedIn(timeinPath: AttendeeTexts.twentyFourHours),
            SizedBox(
              height: 20.sp,
            ),
            const ClockedOut(timeoutPath: AttendeeTexts.twentyFourHours),
            SizedBox(
              height: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class ClockedOut extends StatelessWidget {
  const ClockedOut({
    super.key,
    required this.timeoutPath,
  });

  final String timeoutPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImagesPath.profile,
            height: 40.sp,
          ),
          Text(
            AttendeeTexts.clockedOutMessage,
            style: TextStyle(
                fontFamily: Fonts.serif,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: whiteText),
          ),
          SizedBox(
            width: 5.sp,
          ),
          Text(
            timeoutPath,
            style: TextStyle(
                fontFamily: Fonts.serif,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: whiteText),
          ),
        ],
      ),
    );
  }
}

class ClockedIn extends StatelessWidget {
  const ClockedIn({
    super.key,
    required this.timeinPath,
  });

  final String timeinPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            ImagesPath.profile,
            height: 40.sp,
          ),
          Text(
            AttendeeTexts.clockedInMessage,
            style: TextStyle(
                fontFamily: Fonts.serif,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: whiteText),
          ),
          SizedBox(
            width: 5.sp,
          ),
          Text(
            timeinPath,
            style: TextStyle(
                fontFamily: Fonts.serif,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: whiteText),
          ),
        ],
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({
    super.key,
    required this.dayspath,
  });

  final String dayspath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.sp, top: 10.sp),
      child: Text(
        dayspath,
        style: TextStyle(
          fontFamily: Fonts.serif,
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: whiteText,
        ),
      ),
    );
  }
}

class AppSnackbar {
  final BuildContext context;
  final bool isError;
  final int? seconds;
  final double height;
  final FToast _fToast = FToast();
  AppSnackbar(
    this.context, {
    this.isError = false,
    this.seconds,
    this.height = 60,
  }) {
    _fToast.init(context);
  }
  void showToast({required String text}) {
    final Size size = MediaQuery.of(context).size;
    final Widget toastWidget = Container(
      width: size.width,
      height: height.sp,
      padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 14.0),
      decoration: BoxDecoration(
        color: isError ? const Color(0xFFFF8C39) : const Color(0xFF34A853),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width / 1.4,
            child: Text(
              text,
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: isError
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFFFFFFFF),
                  fontSize: 13.0),
            ),
          ),
        ],
      ),
    );
    _fToast.showToast(
      child: toastWidget,
      toastDuration: Duration(seconds: seconds ?? 4),
      gravity: ToastGravity.TOP,
      positionedToastBuilder: (context, child, gravity) => Positioned(
        //top: 0.h,
        top: size.height * 0.034,
        //left: size.width * 0.0628,
        child: Center(child: child),
      ),
    );
  }
}
