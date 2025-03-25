import 'package:attendee_app/Screens/Navigation/navigation.dart';
import 'package:attendee_app/Screens/Profile/profile.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/update_password.dart';
import 'package:attendee_app/models/users/response/update_password.dart';
import 'package:attendee_app/providers/state_provider/users/password_provider.dart';
import 'package:attendee_app/state/users/password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

UpdatePasswordResponse responseData = UpdatePasswordResponse();

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  bool passwordObscured = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  void handleUpdatePassword() {
    UpdatePasswordModel data = UpdatePasswordModel(
        password: passwordController.text,
        newPassword: newPasswordController.text,
        confirmNewPassword: confirmNewPasswordController.text);
    ref
        .read(updatePasswordStateNotifierProvider.notifier)
        .updatePassword(payload: data);
  }

  @override
  Widget build(BuildContext context) {
    final updatePasswordState = ref.watch(updatePasswordStateNotifierProvider);

    if (updatePasswordState is UpdatePasswordSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(updatePasswordStateNotifierProvider.notifier).resetState();
        responseData = updatePasswordState.responseData;
        changePasswordAlertDialogue(context);
      });
    } else if (updatePasswordState is UpdatePasswordFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(updatePasswordStateNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: AttendeeTexts.incorrectPassword);
      });
    }
    return Scaffold(
      backgroundColor: blackText,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => const
                                ProfileScreen()));
                      },
                      child: Icon(
                        Icons.west,
                        color: whiteText,
                        size: 30.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.sp),
                child: Text(
                  AttendeeTexts.changePassword,
                  style: TextStyle(
                    fontFamily: Fonts.serif,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteText,
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              SizedBox(
                width: 290.sp,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.sp),
                  child: Text(
                    AttendeeTexts.passwordRule,
                    style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: mithril),
                  ),
                ),
              ),
              const Space1(),
              const Text1(textpath: AttendeeTexts.existingPassword),
              const Space2(),

              // Existing Password Textfield
              PasswordField(
                controller: passwordController,
                updateObscured: () {
                  setState(() {
                    passwordObscured = !passwordObscured;
                  });
                },
                passwordObscured: passwordObscured,
              ),
              const Space1(),
              const Text1(textpath: AttendeeTexts.newPassword2),
              const Space2(),

              // New Password Textfield
              PasswordField(
                controller: newPasswordController,
                updateObscured: () {
                  setState(() {
                    passwordObscured = !passwordObscured;
                  });
                },
                passwordObscured: passwordObscured,
              ),
              const Space1(),
              const Text1(textpath: AttendeeTexts.confirmPassword),
              const Space2(),

              // Confirm New Password Textfield
              PasswordField(
                controller: confirmNewPasswordController,
                updateObscured: () {
                  setState(() {
                    passwordObscured = !passwordObscured;
                  });
                },
                passwordObscured: passwordObscured,
              ),
              SizedBox(
                height: 50.sp,
              ),

              if (UpdatePasswordState is UpdatePasswordLoading)
                const Center(child: CircularProgressIndicator())
              else
                
                // Change Password Button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (passwordController.text.isEmpty &&
                          newPasswordController.text.isEmpty &&
                          confirmNewPasswordController.text.isEmpty) {
                        AppSnackbar errorToast =
                            AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: AttendeeTexts.enterAllFields);
                      } else if (passwordController.text.isEmpty) {
                        AppSnackbar errorToast =
                            AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: AttendeeTexts.enterExistingPassword);
                      } else if (newPasswordController.text.isEmpty) {
                        AppSnackbar errorToast =
                            AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: AttendeeTexts.enterNewPassword);
                      } else if (confirmNewPasswordController.text.isEmpty) {
                        AppSnackbar errorToast =
                            AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: AttendeeTexts.enterConfirmPassword);
                      } else {
                        handleUpdatePassword();
                      }
                    },
                    child: Container(
                      height: 59.sp,
                      width: 233.sp,
                      decoration: BoxDecoration(
                        color: shimmeringBlue,
                        borderRadius: BorderRadius.circular(43.r),
                      ),
                      child: Center(
                        child: Text(
                          AttendeeTexts.changePassword2,
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
                ),
              SizedBox(
                height: 30.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> changePasswordAlertDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: whiteText,
          title:const Text(""),
          content: Container(
            height: 30.sp,
            child: Row(
              children: [
                Text(
                  AttendeeTexts.passwordChanged,
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>const NavigationScreen()));
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
  }
}

class Space2 extends StatelessWidget {
  const Space2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10.sp);
  }
}

class Space1 extends StatelessWidget {
  const Space1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.sp,
    );
  }
}

class PasswordField extends StatelessWidget {
  final bool passwordObscured;
  final TextEditingController controller;
  final Function() updateObscured;
  const PasswordField({
    super.key,
    required this.passwordObscured,
    required this.controller,
    required this.updateObscured,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.sp,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        obscureText: passwordObscured,
        decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(43)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
          isCollapsed: true,
          hintText: AttendeeTexts.password,
          hintStyle: TextStyle(
              color: blackText,
              fontFamily: Fonts.serif,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
          filled: true,
          fillColor: whiteText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(43.r),
          ),
          suffixIcon: IconButton(
            onPressed: updateObscured,
            icon: Icon(
              passwordObscured ? Icons.visibility_off : Icons.visibility,
              color: blackText,
            ),
          ),
        ),
      ),
    );
  }
}

class Text1 extends StatelessWidget {
  const Text1({
    super.key,
    required this.textpath,
  });

  final String textpath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15..sp),
      child: Text(
        textpath,
        style: TextStyle(
            fontFamily: Fonts.serif,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: whiteText),
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
                  fontSize: 13.sp),
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
