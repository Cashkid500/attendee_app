class AppEndpoints {
  static const _base = 'https://attendeeee.000webhostapp.com/api/users/auth';

  // Login Endpoint
  static const login = '$_base/login.php';

  // Attendance Endpoint
  static const attendancein = '$_base/Attendance_In.php';
  static const attendanceout = '$_base/Attendance_Out.php';

  // Password Endpoints
  static const forgotPassword = '$_base/Forgot_Password.php';
  static const verifyForgotPassword = '$_base/Forgot_Password_Verify.php';
  static const setForgotPassword = '$_base/Forgot_Password_Set.php';
  static const updatePassword = '$_base/Update_Password.php';

  // Fetch Notification
  static const fetchNotification = '$_base/fetch_notifications.php';

  // Get Calendar
  static const getCalendar = '$_base/get_calendar_data.php';

// Edit Profile
  static const editProfile = '$_base/Edit_Profile.php';
  //*****************************************
  //*******   REGISTER   ********************
  //*****************************************

}
