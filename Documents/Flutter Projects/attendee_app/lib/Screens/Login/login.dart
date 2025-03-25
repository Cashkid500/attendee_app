import 'dart:developer';
import 'package:attendee_app/Screens/ForgotPassword/password_reset.dart';
import 'package:attendee_app/Screens/Navigation/navigation.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/login.dart';
import 'package:attendee_app/providers/state_provider/users/login_provider.dart';
import 'package:attendee_app/state/users/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isSecurePassword = true;
  void handleLogin() {
    LoginModel data = LoginModel(
        email: emailController.text, password: passwordController.text);
    ref
        .read(loginStateNotifierProvider.notifier)
        .login(value: data, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginStateNotifierProvider);
    log(loginState.runtimeType.toString());

    if (loginState is LoginSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(loginStateNotifierProvider.notifier).resetstate();
        // responseData = loginstate.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: AttendeeTexts.successful);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const NavigationScreen()));
      });
    } else if (loginState is LoginFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(loginStateNotifierProvider.notifier).resetstate();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: loginState.failure.message);
      });
    }
    return Scaffold(
      backgroundColor: blackText,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 35.sp),
            child: Column(
              children: [
                SizedBox(
                  height: 70.sp,
                ),
                Center(
                  child: Text(
                    AttendeeTexts.logintext,
                    style: TextStyle(
                        color: whiteText,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: Fonts.roman),
                  ),
                ),
                Text(
                  AttendeeTexts.loginaccount,
                  style: TextStyle(
                    color: whiteText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: Fonts.roman,
                  ),
                ),
                SizedBox(
                  height: 60.sp,
                ),
                // Email TextField
                SizedBox(
                  width: 370.sp,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(43.r)),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 20.sp),
                        isCollapsed: true,
                        hintText: AttendeeTexts.mailtext,
                        hintStyle: TextStyle(
                            fontFamily: Fonts.serif,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: blackText),
                        filled: true,
                        fillColor: whiteText,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(43.r),
                        ),
                        prefixIcon: Image.asset(ImagesPath.mail)),
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                // Password TextField
                SizedBox(
                  width: 370.sp,
                  child: TextField(
                    controller: passwordController,
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
                          fontFamily: Fonts.serif,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: blackText),
                      filled: true,
                      fillColor: whiteText,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(43.r),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 8.sp),
                        child: Image.asset(ImagesPath.lock),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSecurePassword = !_isSecurePassword;
                          });
                        },
                        icon: _isSecurePassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        color: blackText,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.sp,
                ),

                if (LoginState is LoginLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  // Login Button
                  GestureDetector(
                    onTap: () {
                      if (emailController.text.isEmpty &&
                          passwordController.text.isEmpty) {
                        AppSnackbar errorToast =
                            AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: AttendeeTexts.inputLoginDetails);
                      } else if (passwordController.text.isNotEmpty &&
                          emailController.text.isEmpty) {
                        AppSnackbar errorToast =
                            AppSnackbar(context, isError: true);
                        errorToast.showToast(
                            text: AttendeeTexts.inputValidEmail);
                      } else if (emailController.text.isNotEmpty &&
                          passwordController.text.isEmpty) {
                        AppSnackbar errorToast =
                            AppSnackbar(context, isError: true);
                        errorToast.showToast(text: AttendeeTexts.inputPassword);
                      } else {
                        handleLogin();
                        // ref.read(loginStateNotifierProvider.notifier).login(
                        //     context: context,
                        //     value: LoginModel(
                        //         email: emailController.text,
                        //         password: passwordController.text));
                      }
                    },
                    child: Container(
                      height: 53.sp,
                      width: 213.sp,
                      decoration: BoxDecoration(
                        color: shimmeringBlue,
                        borderRadius: BorderRadius.circular(43),
                      ),
                      child: Center(
                        child: Text(
                          AttendeeTexts.logintext,
                          style: TextStyle(
                            fontFamily: Fonts.serif,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 20.sp,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const Resetpassword()));
                  },
                  child: RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          fontFamily: Fonts.roman,
                        ),
                        children: [
                          TextSpan(
                            text: AttendeeTexts.forgotpassword,
                            style: TextStyle(
                                color: whiteText,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: AttendeeTexts.reset,
                            style: TextStyle(
                                color: shimmeringBlue,
                                fontFamily: Fonts.roman,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 50.sp,
                ),
                Container(
                  height: 60.sp,
                  width: 300.sp,
                  decoration: BoxDecoration(
                    color: shimmeringBlue,
                    borderRadius: BorderRadius.circular(43.r),
                    border: Border.all(
                      width: 1.sp,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AttendeeTexts.googlecontinue,
                        style: TextStyle(
                            color: blackText,
                            fontFamily: Fonts.serif,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Image.asset(ImagesPath.google)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                )
              ],
            ),
          ),
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

class ShowToast {
  static void errorToast(BuildContext context, String text) {
    AppSnackbar toast = AppSnackbar(context, isError: true);
    toast.showToast(text: text);
  }

  static void successToast(BuildContext context, String text) {
    AppSnackbar toast = AppSnackbar(context);
    toast.showToast(text: text);
  }
}
