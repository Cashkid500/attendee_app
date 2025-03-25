import 'package:attendee_app/Screens/Onboarding/onboarding.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/response/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jumping_dot/jumping_dot.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LoginResponseAdapter());
  Hive.registerAdapter(DataAdapter());
  box = await Hive.openBox<LoginResponse>('loginResponseBox');
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>const Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 175.sp, bottom: 40.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 310.sp,
                    child: Image.asset(
                      ImagesPath.logo,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: JumpingDots(
                  color: walledGarden,
                  radius: 17.sp,
                  numberOfDots: 3,
                  animationDuration: const Duration(milliseconds: 200),
                ),
              ),
              SizedBox(
                height: 40.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AttendeeTexts.savertech,
                    style: TextStyle(
                      fontFamily: Fonts.serif,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: blackText,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
