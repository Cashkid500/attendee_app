import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:attendee_app/Screens/Login/login.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: shimmeringBlue,
        body: PageView(
          children: [
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>const Login()));
                        },
                        child: Text(
                          AttendeeTexts.skip,
                          style: TextStyle(
                              color: blackText,
                              fontFamily: Fonts.roman,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Image.asset(ImagesPath.alarm),
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          AttendeeTexts.onboardingtext1,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: Fonts.serif,
                              fontWeight: FontWeight.bold,
                              color: blackText),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.sp, left: 90.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 85.sp,
                              height: 55.sp,
                              child: Column(
                                children: [
                                  DefaultTextStyle(
                                    style: TextStyle(
                                        fontFamily: Fonts.serif,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: blackText.withOpacity(0.45)),
                                    child: AnimatedTextKit(
                                      isRepeatingAnimation: true,
                                      animatedTexts: [
                                        RotateAnimatedText(' \nfaster'),
                                        RotateAnimatedText(' \nwith ease'),
                                        RotateAnimatedText(' \nefficiently'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 15.sp,
                        width: 15.sp,
                        decoration: BoxDecoration(
                            color: whiteText,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Container(
                        height: 15.sp,
                        width: 15.sp,
                        decoration: BoxDecoration(
                            color: blackText,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ],
                  )
                ],
              ),
            )),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 85.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.sp,
                  ),
                  SizedBox(
                      height: 200.sp,
                      child: Image.asset(ImagesPath.onboardingcalendar)),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          AttendeeTexts.onboardingtext2,
                          style: TextStyle(
                            fontFamily: Fonts.serif,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: blackText,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 15.sp,
                        width: 15.sp,
                        decoration: BoxDecoration(
                            color: blackText,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Container(
                        height: 15.sp,
                        width: 15.sp,
                        decoration: BoxDecoration(
                            color: whiteText,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>const Login()));
                    },
                    child: Container(
                      height: 45.sp,
                      width: 170.sp,
                      decoration: BoxDecoration(
                        color: whiteText.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(43),
                        border: Border.all(color: blackText),
                      ),
                      child: Center(
                        child: Text(
                          AttendeeTexts.next,
                          style: TextStyle(
                              color: blackText,
                              fontFamily: Fonts.roman,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ));
  }
}
