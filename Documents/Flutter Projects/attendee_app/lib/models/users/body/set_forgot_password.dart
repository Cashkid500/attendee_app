class SetForgotPasswordModel {
  final String email;
  final String newPassword;
  final String confirmNewPassword;

  SetForgotPasswordModel(
      {
      required this.email, required this.newPassword, required this.confirmNewPassword});
}
