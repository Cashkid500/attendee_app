import 'package:attendee_app/Screens/Login/login.dart';
import 'package:attendee_app/Screens/Profile/change_password.dart';
import 'package:attendee_app/Screens/Profile/edit_profile.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const deleteAccountDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cannonBarrel,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.sp, right: 25.sp, top: 50.sp),
              child: Container(
                height: 180.sp,
                width: 300.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(87.r),
                    border: Border.all(color: whiteText)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 100.sp, top: 20.sp),
                          child: Image.asset(
                            ImagesPath.avatar,
                            height: 60.sp,
                          ),
                        ),
                        SizedBox(
                          width: 40.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.sp),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => const
                                        EditProfileScreen()));
                              },
                              child: Image.asset(
                                ImagesPath.edit,
                                color: whiteText,
                                height: 40.sp,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      AttendeeTexts.userName,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: whiteText,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      AttendeeTexts.role,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      AttendeeTexts.workDepartment,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesPath.bag,
                    height: 30.sp,
                  ),
                  Column(
                    children: [
                      Text(
                        AttendeeTexts.org,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: whiteText,
                        ),
                      ),
                      SizedBox(
                        height: 2.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.sp),
                        child: Text(
                          AttendeeTexts.companyName,
                          style: TextStyle(
                            fontFamily: Fonts.serif,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: whiteText,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.sp,
              width: 430.sp,
              child: Divider(
                color: germanGrey,
                thickness: 4.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: Text(
                AttendeeTexts.personalInfo,
                style: TextStyle(
                  fontFamily: Fonts.serif,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: whiteText,
                ),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesPath.person,
                    height: 30.sp,
                  ),
                  SizedBox(
                    width: 8.sp,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14.sp),
                        child: Text(
                          AttendeeTexts.gender,
                          style: TextStyle(
                            fontFamily: Fonts.serif,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: whiteText,
                          ),
                        ),
                      ),
                      Text(
                        AttendeeTexts.male,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: whiteText,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagesPath.email,
                    height: 28.sp,
                  ),
                  SizedBox(
                    width: 25.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AttendeeTexts.email,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: whiteText,
                        ),
                      ),
                      Text(
                        AttendeeTexts.mail,
                        style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: whiteText,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),

            // Change Password
            Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>const
                          ChangePasswordScreen()));
                },
                child: Container(
                  height: 59.sp,
                  width: 327.sp,
                  decoration: BoxDecoration(
                      color: blackText,
                      borderRadius: BorderRadius.circular(43.r)),
                  child: Center(
                    child: Text(
                      AttendeeTexts.changePassword,
                      style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: whiteText),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),

            // Delete Account
            Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: GestureDetector(
                onTap: () {
                  _showOrderDialog(context);
                },
                child: Container(
                  height: 59.sp,
                  width: 327.sp,
                  decoration: BoxDecoration(
                      color: chilledChilly,
                      borderRadius: BorderRadius.circular(43.r)),
                  child: Center(
                    child: Text(
                      AttendeeTexts.deleteAccount,
                      style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: blackText),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),

            // Log Out
            Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>const Login()));
                },
                child: Container(
                  height: 59.sp,
                  width: 327.sp,
                  decoration: BoxDecoration(
                      color: shimmeringBlue,
                      borderRadius: BorderRadius.circular(43.r)),
                  child: Center(
                    child: Text(
                      AttendeeTexts.logOut,
                      style: TextStyle(
                          fontFamily: Fonts.serif,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: blackText),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class deleteAccountDialog extends StatelessWidget {
  const deleteAccountDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteText,
      title: Text(
        AttendeeTexts.confirm,
        style: TextStyle(
          fontFamily: Fonts.serif,
          fontSize: 16.sp,
          fontWeight: FontWeight.w800,
          color: blackText,
        ),
      ),
      content: Container(
        height: 170.sp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AttendeeTexts.deletion,
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
              AttendeeTexts.warning,
              style: TextStyle(
                fontFamily: Fonts.serif,
                fontSize: 16.sp,
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: whiteText,
                            title: const Text(""),
                            content: Container(
                              height: 30.sp,
                              child: Row(
                                children: [
                                  Text(
                                    AttendeeTexts.accountDeleted,
                                    style: TextStyle(
                                      fontFamily: Fonts.serif,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14.sp,
                                      color: blackText,
                                    ),
                                  ),
                                  Expanded(
                                      child: Icon(
                                    Icons.check_circle,
                                    color: walledGarden,
                                  )),
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>const
                                                  ProfileScreen()));
                                    },
                                    child: Text(
                                      AttendeeTexts.back,
                                      style: TextStyle(
                                        fontFamily: Fonts.serif,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: blackText,
                                      ),
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
                    child: Text(
                      AttendeeTexts.confirm2,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w900,
                        color: whiteText,
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
