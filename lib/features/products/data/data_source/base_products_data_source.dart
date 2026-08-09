import 'dart:io';

import 'package:dio/dio.dart';
import 'package:joli_crm/core/constants/api_constants.dart';
import 'package:joli_crm/core/models/api_response_model.dart';
import 'package:joli_crm/core/models/empty_response_model.dart';
import 'package:joli_crm/features/products/data/models/category_model.dart';
import 'package:joli_crm/features/products/data/models/create_product_model.dart';
import 'package:joli_crm/features/products/data/models/get_all_products_model.dart';
import 'package:joli_crm/features/products/data/models/get_product_by_id_model.dart';
import 'package:joli_crm/features/products/data/models/update_product_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'base_products_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BaseProductsDataSource {
  factory BaseProductsDataSource(Dio dio, {String? baseUrl}) =
      _BaseProductsDataSource;

  @GET(ApiConstants.products)
  Future<GetAllProductsModel> getAllProducts(
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @POST(ApiConstants.products)
  @MultiPart()
  Future<CreateProductModel> createProduct(
    @Part(name: "productName") String productName,
    @Part(name: "productDescription") String productDescription,
    @Part(name: "productPrice") double productPrice,
    @Part(name: "productSize") String productSize,
    @Part(name: "productImage") MultipartFile productImage,
    @Part(name: "categoryId") String categoryId,
  );

  @GET(ApiConstants.getProductsById)
  Future<ApiResponseModel<GetProductByIdModel>> getProductById(
    @Path("productId") String id,
  );

  @PATCH(ApiConstants.updateProduct)
  Future<ApiResponseModel<UpdateProductModel>> updateProduct(
    @Path("productId") String id,
    @Part(name: "productName") String? productName,
    @Part(name: "productDescription") String? productDescription,
    @Part(name: "productPrice") double? productPrice,
    @Part(name: "productSize") String? productSize,
    @Part(name: "productImage") MultipartFile? productImage,
    @Part(name: "categoryId") String? categoryId,
  );

  @DELETE(ApiConstants.deleteProduct)
  Future<ApiResponseModel<EmptyResponseModel>> deleteProduct(
    @Path("productId") String id,
  );

  @GET(ApiConstants.getAllCategories)
  Future<ApiResponseModel<List<CategoryModel>>> getAllCategories();

  @POST(ApiConstants.createCategory)
  Future<ApiResponseModel<CategoryModel>> createCategory(
    @Body() CategoryModel category,
  );
}
