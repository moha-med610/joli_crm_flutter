import 'package:dio/dio.dart';
import 'package:joli_crm/core/constants/api_constants.dart';
import 'package:joli_crm/features/customers/data/models/create_customer_model.dart';
import 'package:joli_crm/features/customers/data/models/customers_res_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'customers_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CustomersDataSource {
  factory CustomersDataSource(Dio dio, {String? baseUrl}) =
      _CustomersDataSource;

  @GET(ApiConstants.getAllCustomers)
  Future<AllCustomersModel> getAllCustomers(
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET(ApiConstants.searchCustomers)
  Future<AllCustomersModel> searchCustomers(@Query("name") String name);

  @GET(ApiConstants.getSingleCustomer)
  Future<SingleCustomerModel> getCustomerById(
    @Path("customerId") String customerId,
  );

  @POST(ApiConstants.createCustomer)
  Future<SingleCustomerModel> createCustomer(@Body() CreateCustomerModel data);

  @PATCH(ApiConstants.updateCustomer)
  Future<SingleCustomerModel> updateCustomer(
    @Path("customerId") String customerId,
    @Body() CreateCustomerModel data,
  );

  @DELETE(ApiConstants.deleteCustomer)
  Future<DeleteCustomerModel> deleteCustomer(
    @Path("customerId") String customerId,
  );
}
