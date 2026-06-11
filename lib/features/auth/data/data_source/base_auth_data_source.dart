import 'package:dio/dio.dart';
import 'package:joli_crm/core/constants/api_constants.dart';
import 'package:joli_crm/features/auth/data/models/auth_req_model.dart';
import 'package:joli_crm/features/auth/data/models/auth_res_model.dart';
import 'package:joli_crm/features/auth/data/models/login_res_model.dart';
import 'package:joli_crm/features/auth/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'base_auth_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BaseAuthDataSource {
  factory BaseAuthDataSource(Dio dio, {String? baseUrl}) = _BaseAuthDataSource;

  @POST(ApiConstants.login)
  Future<LoginResModel> login(@Body() LoginReqModel data);

  @POST(ApiConstants.forgetPassword)
  Future<AuthResModel> forgetPassword(@Body() ForgetPasswordReqModel data);

  @POST(ApiConstants.verifyOtpForgetPassword)
  Future<AuthResModel> verifyForgetPasswordOtp(
    @Body() VerifyForgetPasswordOtpReqModel data,
  );

  @POST(ApiConstants.resetPassword)
  Future<AuthResModel> resetPassword(@Body() ResetPasswordReqModel data);

  @POST(ApiConstants.logout)
  Future<AuthResModel> logout();

  @GET(ApiConstants.profile)
  Future<UserResModel> profile();
}
