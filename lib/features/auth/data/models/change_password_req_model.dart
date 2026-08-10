class ChangePasswordReqModel {
  final String oldPassword;
  final String newPassword;
  final String confirmNewPassword;

  ChangePasswordReqModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });
}
