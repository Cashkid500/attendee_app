import 'package:attendee_app/Screens/ForgotPassword/new_password.dart';
import 'package:attendee_app/Screens/ForgotPassword/password_reset.dart';
import 'package:attendee_app/Screens/Profile/change_password.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/verify_forgot_password.dart';
import 'package:attendee_app/models/users/response/verify_forgot_password.dart';
import 'package:attendee_app/providers/state_provider/users/password_provider.dart';
import 'package:attendee_app/state/users/password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key, required this.email});
  final String email;

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

VerifyForgotPasswordResponse responseData = VerifyForgotPasswordResponse();

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  TextEditingController resetCodeController = TextEditingController();
  void handleVerifyForgotPassword() {
    VerifyForgotPasswordModel data =
        VerifyForgotPasswordModel(email: widget.email, resetCode: resetCodeController.text);
    ref
        .read(verifyForgotPasswordStateNotifierProvider.notifier)
        .verifyForgotPassword(payload: data);
  }

  @override
  Widget build(BuildContext context) {
    final verifyForgotPasswordState =
        ref.watch(verifyForgotPasswordStateNotifierProvider);

    if (verifyForgotPasswordState is VerifyForgotPasswordSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(verifyForgotPasswordStateNotifierProvider.notifier)
            .resetState();
        responseData = verifyForgotPasswordState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
                        errorToast.showToast(
                            text: AttendeeTexts.codeVerified);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => NewPassword(forgotPasswordEmail: widget.email,)));
      });
    } else if (verifyForgotPasswordState is VerifyForgotPasswordFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(verifyForgotPasswordStateNotifierProvider.notifier)
            .resetState();
            AppSnackbar errorToast = AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: verifyForgotPasswordState.failure.message);
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
                        builder: (BuildContext context) => const Resetpassword()));
                  },
                  child: Icon(
                    Icons.west,
                    color: whiteText,
                    size: 30.sp,
                  ),
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Text(
                  AttendeeTexts.forgotpassword,
                  style: TextStyle(
                      color: whiteText,
                      fontFamily: Fonts.serif,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  children: [
                    Text(
                      AttendeeTexts.staycalm,
                      style: TextStyle(
                          color: whiteText,
                          fontFamily: Fonts.serif,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.sp,
                ),

                // OTP TextField
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    cursorHeight: 19,
                    controller: resetCodeController,
                    enableActiveFill: true,
                    textStyle: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: Fonts.serif,
                      fontWeight: FontWeight.normal,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      fieldWidth: 60.sp,
                      inactiveColor: whiteText,
                      activeColor: whiteText,
                      selectedColor: blackText,
                      activeFillColor: whiteText,
                      selectedFillColor: whiteText,
                      inactiveFillColor: whiteText,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: 60.sp,
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
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: whiteText,
                          fontFamily: Fonts.serif,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                SizedBox(
                  height: 40.sp,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: whiteText,
                          fontFamily: Fonts.serif,
                        ),
                        children: [
                          TextSpan(
                              text: AttendeeTexts.codeExpires,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                              text: AttendeeTexts.fiveminutes,
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.w600),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),

                if (VerifyForgotPasswordState is VerifyForgotPasswordLoading)
                  const Center(child: CircularProgressIndicator())
                else
                // Verify Code Button
                GestureDetector(
                  onTap: () {
                    if (resetCodeController.text.isEmpty) {
                      AppSnackbar errorToast = AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: AttendeeTexts.resetCode);
                    } else {
                      ref.read(verifyForgotPasswordStateNotifierProvider.notifier).verifyForgotPassword(payload: VerifyForgotPasswordModel(email: widget.email, resetCode: resetCodeController.text));
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
                          AttendeeTexts.verifycode,
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
                  height: 40.sp,
                ),

                // Resend Code
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const Resetpassword()));
                    },
                    child: Text(
                      AttendeeTexts.resendcode,
                      style: TextStyle(
                          color: whiteText,
                          fontFamily: Fonts.serif,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
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
