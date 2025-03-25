import 'package:attendee_app/Screens/ForgotPassword/forgot_password.dart';
import 'package:attendee_app/Screens/Login/login.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/set_forgot_password.dart';
import 'package:attendee_app/models/users/response/set_forgot_password.dart';
import 'package:attendee_app/providers/state_provider/users/password_provider.dart';
import 'package:attendee_app/state/users/password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewPassword extends ConsumerStatefulWidget {
  const NewPassword({super.key, required this.forgotPasswordEmail});
  final String forgotPasswordEmail;

  @override
  ConsumerState<NewPassword> createState() => _NewPasswordState();
}

SetForgotPasswordResponse responseData = SetForgotPasswordResponse();

class _NewPasswordState extends ConsumerState<NewPassword> {
  bool _isSecurePassword = true;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  void handleSetForgotPassword() {
    SetForgotPasswordModel data = SetForgotPasswordModel(
        email: widget.forgotPasswordEmail,
        newPassword: newPasswordController.text,
        confirmNewPassword: confirmNewPasswordController.text);
    ref
        .read(setForgotPasswordStateNotifierProvider.notifier)
        .setForgotPassword(payload: data);
  }

  @override
  Widget build(BuildContext context) {
    final setForgotPasswordState =
        ref.watch(setForgotPasswordStateNotifierProvider);

    if (setForgotPasswordState is SetForgotPasswordSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(setForgotPasswordStateNotifierProvider.notifier).resetState();
        responseData = setForgotPasswordState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: AttendeeTexts.passwordReset);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => const Login()));
      });
    } else if (setForgotPasswordState is SetForgotPasswordFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(setForgotPasswordStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: setForgotPasswordState.failure.message);
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
                        builder: (BuildContext context) => ForgotPassword(
                              email: widget.forgotPasswordEmail,
                            )));
                  },
                  child: Icon(
                    Icons.west,
                    size: 30.sp,
                    color: whiteText,
                  ),
                ),
                SizedBox(
                  height: 60.sp,
                ),
                Text(
                  AttendeeTexts.newPassword,
                  style: TextStyle(
                      color: whiteText,
                      fontFamily: Fonts.serif,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20.sp,
                ),

                // New Password TextField
                SizedBox(
                  width: 370.sp,
                  child: TextField(
                    controller: newPasswordController,
                    keyboardType: TextInputType.multiline,
                    obscureText: _isSecurePassword,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(43.r)),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 20.sp),
                        isCollapsed: true,
                        hintText: AttendeeTexts.password,
                        hintStyle: TextStyle(
                            color: blackText,
                            fontFamily: Fonts.serif,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: whiteText,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(43.r),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isSecurePassword = !_isSecurePassword;
                            });
                          },
                          icon: _isSecurePassword
                              ?const Icon(Icons.visibility_off)
                              :const Icon(Icons.visibility),
                          color: blackText,
                        )),
                  ),
                ),
                SizedBox(
                  height: 40.sp,
                ),

                // Confirm New Password TextField
                Text(
                  AttendeeTexts.confirmnewpassword,
                  style: TextStyle(
                      color: whiteText,
                      fontFamily: Fonts.serif,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                SizedBox(
                  width: 370.sp,
                  child: TextField(
                    controller: confirmNewPasswordController,
                    keyboardType: TextInputType.multiline,
                    obscureText: _isSecurePassword,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(43.r)),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 20.sp),
                        isCollapsed: true,
                        hintText: AttendeeTexts.password,
                        hintStyle: TextStyle(
                            color: blackText,
                            fontFamily: Fonts.serif,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: whiteText,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(43.r),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isSecurePassword = !_isSecurePassword;
                            });
                          },
                          icon: _isSecurePassword
                              ?const Icon(Icons.visibility_off)
                              :const Icon(Icons.visibility),
                          color: blackText,
                        )),
                  ),
                ),
                SizedBox(
                  height: 90.sp,
                ),

                if (SetForgotPasswordState is SetForgotPasswordLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  // Submit Button
                  GestureDetector(
                    onTap: () {
                      if (newPasswordController.text.isEmpty &&
                          confirmNewPasswordController.text.isNotEmpty) {
                        Fluttertoast.showToast(
                            msg: AttendeeTexts.enterNewPassword,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.sp);
                      } else if (newPasswordController.text.isNotEmpty &&
                          confirmNewPasswordController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: AttendeeTexts.enterConfirmPassword,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.sp);
                      } else {
                        ref
                            .read(
                                setForgotPasswordStateNotifierProvider.notifier)
                            .setForgotPassword(
                                payload: SetForgotPasswordModel(
                                    newPassword: newPasswordController.text,
                                    confirmNewPassword:
                                        confirmNewPasswordController.text,
                                    email: newPasswordController.text));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 59.sp,
                          width: 250.sp,
                          decoration: BoxDecoration(
                            color: shimmeringBlue,
                            borderRadius: BorderRadius.circular(43.r),
                          ),
                          child: Center(
                            child: Text(
                              AttendeeTexts.submit,
                              style: TextStyle(
                                fontFamily: Fonts.serif,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
