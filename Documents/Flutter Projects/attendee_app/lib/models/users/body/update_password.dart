class UpdatePasswordModel {
  final String password;
  final String newPassword;
  final String confirmNewPassword;

  UpdatePasswordModel(
      {required this.password,
      required this.newPassword,
      required this.confirmNewPassword});
}
