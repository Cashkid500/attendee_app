import 'package:attendee_app/Screens/ForgotPassword/forgot_password.dart';
import 'package:attendee_app/Screens/Login/login.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/forgot_password.dart';
import 'package:attendee_app/models/users/response/forgot_password.dart';
import 'package:attendee_app/providers/state_provider/users/password_provider.dart';
import 'package:attendee_app/state/users/password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Resetpassword extends ConsumerStatefulWidget {
  const Resetpassword({super.key});

  @override
  ConsumerState<Resetpassword> createState() => _ResetpasswordState();
}

ForgotPasswordResponse responseData = ForgotPasswordResponse();

class _ResetpasswordState extends ConsumerState<Resetpassword> {
  TextEditingController emailController = TextEditingController();
  void handleForgotPassword() {
    ForgotPasswordModel data = ForgotPasswordModel(email: emailController.text);
    ref
        .read(forgotPasswordStateNotifierProvider.notifier)
        .forgotPassword(payload: data);
  }

  @override
  Widget build(BuildContext context) {
    final forgotPasswordState = ref.watch(forgotPasswordStateNotifierProvider);
    print(forgotPasswordState.runtimeType.toString());
    if (forgotPasswordState is ForgotPasswordSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(forgotPasswordStateNotifierProvider.notifier).resetState();
        responseData = forgotPasswordState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
                        errorToast.showToast(
                            text: AttendeeTexts.code);
            Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ForgotPassword(email: emailController.text,)));
      });
    } else if (forgotPasswordState is ForgotPasswordFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(forgotPasswordStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: forgotPasswordState.failure.message);
      });
    }
    return Scaffold(
      backgroundColor: blackText,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 35.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>const Login()));
                  },
                  child: Icon(
                    Icons.west,
                    color: whiteText,
                    size: 30.sp,
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                Text(
                  AttendeeTexts.entermail,
                  style: TextStyle(
                    color: whiteText,
                    fontFamily: Fonts.serif,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                SizedBox(
                  width: 300.sp,
                  child: Text(
                    AttendeeTexts.entermailaddress,
                    style: TextStyle(
                        color: whiteText,
                        fontFamily: Fonts.serif,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),

                // Email TextFormField
                SizedBox(
                  width: 370.sp,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(43.r)),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 20.sp),
                        isCollapsed: true,
                        hintText: AttendeeTexts.mailtext,
                        hintStyle: TextStyle(
                            color: blackText,
                            fontFamily: Fonts.roman,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400),
                        // labelText:'',
                        labelStyle: TextStyle(
                            color: blackText,
                            fontFamily: Fonts.roman,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: whiteText,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(43.r),
                        ),
                        prefixIcon: Image.asset(
                          ImagesPath.mail,
                          color: blackText,
                        ),
                      ),
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),

                if (ForgotPasswordState is ForgotPasswordLoading)
                  const Center(child: CircularProgressIndicator())
                else
                // Continue Button
                GestureDetector(
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      AppSnackbar errorToast = AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: AttendeeTexts.enterYourEmailAddress);
                    } else {
                      ref.read(forgotPasswordStateNotifierProvider.notifier).forgotPassword(payload: ForgotPasswordModel(email: emailController.text));
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 59.sp,
                      width: 233.sp,
                      decoration: BoxDecoration(
                        color: shimmeringBlue,
                        borderRadius: BorderRadius.circular(43.r),
                      ),
                      child: Center(
                        child: Text(
                          AttendeeTexts.continuetext,
                          style: TextStyle(
                            fontFamily: Fonts.serif,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.sp,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AttendeeTexts.senttomail,
                          style: TextStyle(
                            color: whiteText,
                            fontFamily: Fonts.serif,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      // AttendeeTexts.mail,
                      emailController.text,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: whiteText,
                          fontFamily: Fonts.serif,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
