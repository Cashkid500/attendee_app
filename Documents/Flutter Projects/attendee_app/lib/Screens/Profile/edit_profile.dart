import 'package:attendee_app/Screens/Navigation/navigation.dart';
import 'package:attendee_app/Screens/Profile/profile.dart';
import 'package:attendee_app/constants/assets_path.dart';
import 'package:attendee_app/constants/color_constants.dart';
import 'package:attendee_app/constants/text_constants.dart';
import 'package:attendee_app/models/users/body/edit_profile.dart';
import 'package:attendee_app/models/users/response/edit_profile.dart';
import 'package:attendee_app/providers/state_provider/users/edit_profile_provider.dart';
import 'package:attendee_app/state/users/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

EditProfileResponse responseData = EditProfileResponse();

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController gendarController = TextEditingController();
  TextEditingController emailaddressController = TextEditingController();
  TextEditingController jobdescriptionController = TextEditingController();
  void handleEditProfile() {
    EditProfileModel data = EditProfileModel(
        newName: fullnameController.text,
        newEmail: emailaddressController.text,
        newDepartment: departmentController.text,
        newDescription: jobdescriptionController.text,
        newGender: gendarController.text);
    ref.read(editProfileNotifierProvider.notifier).editProfile(payload: data);
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(editProfileNotifierProvider.notifier).resetstate();
    // });
    final editProfileState = ref.watch(editProfileNotifierProvider);
    if (editProfileState is EditProfileSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(editProfileNotifierProvider.notifier).resetstate();
        responseData = editProfileState.responseData;
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: AttendeeTexts.confirmChangesSuccessful);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const ProfileScreen()));
      });
    } else if (editProfileState is EditProfileFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(editProfileNotifierProvider.notifier).resetstate();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(text: editProfileState.failure.message);
      });
    }
    return Scaffold(
      backgroundColor: cannonBarrel,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 40.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ProfileScreen()));
                      },
                      child: Icon(
                        Icons.west,
                        color: whiteText,
                        size: 30.sp,
                      ),
                    ),
                    Text(
                      AttendeeTexts.editProfile,
                      style: TextStyle(
                        fontFamily: Fonts.serif,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteText,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const NavigationScreen()));
                      },
                      child: Icon(
                        Icons.home,
                        color: whiteText,
                        size: 35.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.sp),
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: const AssetImage(ImagesPath.avatar),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: Image.asset(ImagesPath.camera),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              TextField1(
                controller: fullnameController,
                labelpath: AttendeeTexts.fullName,
                validator: (value) {},
              ),
              const SizedBox1(),
              TextField1(
                controller: departmentController,
                labelpath: AttendeeTexts.department,
                validator: (value) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)
                      ? null
                      : AttendeeTexts.validEmail;
                },
              ),
              const SizedBox1(),
              TextField1(
                controller: gendarController,
                labelpath: AttendeeTexts.gender,
                validator: (value) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)
                      ? null
                      : AttendeeTexts.validEmail;
                },
              ),
              const SizedBox1(),
              TextField1(
                controller: emailaddressController,
                labelpath: AttendeeTexts.email,
                validator: (value) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)
                      ? null
                      : AttendeeTexts.validEmail;
                },
              ),
              const SizedBox1(),
              TextField1(
                controller: jobdescriptionController,
                labelpath: AttendeeTexts.jobDescription,
                validator: (value) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)
                      ? null
                      : AttendeeTexts.validEmail;
                },
              ),
              SizedBox(height: 40.sp),
              if (editProfileState is EditProfileLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              
              else

                // Login Button
                GestureDetector(
                  onTap: () {
                    if (emailaddressController.text.isEmpty &&
                        fullnameController.text.isEmpty &&
                        jobdescriptionController.text.isEmpty &&
                        gendarController.text.isEmpty &&
                        departmentController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(
                          text: AttendeeTexts.inputEditProfileCredentials);
                    } else if (fullnameController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(text: AttendeeTexts.inputFullName);
                    } else if (departmentController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(text: AttendeeTexts.inputDepartment);
                    } else if (gendarController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(text: AttendeeTexts.inputGender);
                    } else if (emailaddressController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(
                          text: AttendeeTexts.inputEmailAddress);
                    } else if (jobdescriptionController.text.isEmpty) {
                      AppSnackbar errorToast =
                          AppSnackbar(context, isError: true);
                      errorToast.showToast(
                          text: AttendeeTexts.inputJobDescription);
                    } else {
                      handleEditProfile();
                    }
                    //if( gendarController.text.isgendarController)
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
                          AttendeeTexts.confirmChanges,
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
            ],
          ),
        ),
      ),
    );
  }
}

class SizedBox1 extends StatelessWidget {
  const SizedBox1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.sp,
    );
  }
}

class TextField1 extends StatelessWidget {
  const TextField1({
    super.key,
    required this.labelpath,
    required this.controller,
    required String? Function(dynamic value) validator,
  });

  final String labelpath;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: Padding(
        padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(43.r)),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            isCollapsed: true,
            hintText: labelpath,
            hintStyle: TextStyle(
                color: blackText,
                fontFamily: Fonts.serif,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400),
            filled: true,
            fillColor: whiteText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(43),
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

// Bottom Sheet
void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200.sp,
        decoration: BoxDecoration(
          color: cannonBarrel,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
        // Content of the bottom sheet
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Column(
                children: [
                  SizedBox(
                    height: 5.sp,
                  ),
                  SizedBox(
                    height: 4.sp,
                    width: 100.sp,
                    child: Divider(
                      color: whiteText,
                      thickness: 5.sp,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.sp, left: 20.sp),
                        child: Container(
                          height: 40.sp,
                          width: 40.sp,
                          decoration: BoxDecoration(
                            color: Brilliant,
                            borderRadius: BorderRadius.circular(16.r),
                            // image: DecorationImage(
                            //     image:
                            //         Image(image: AssetImage(ImagesPath.upload))
                            //             .image),
                          ),
                          child: Icon(Icons.image, color: whiteText),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.sp, top: 30.sp),
                        child: Text(
                          AttendeeTexts.upload,
                          style: TextStyle(
                              fontFamily: Fonts.serif,
                              color: blackText,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                // Handle option 1
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.sp, left: 20.sp),
                    child: Container(
                      height: 40.sp,
                      width: 40.sp,
                      decoration: BoxDecoration(
                        color: Brilliant,
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                            image: Image(image: AssetImage(ImagesPath.camera2))
                                .image),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.sp, top: 20.sp),
                    child: Text(
                      AttendeeTexts.photo,
                      style: TextStyle(
                          fontFamily: Fonts.serif,
                          color: blackText,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Handle option 2
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
