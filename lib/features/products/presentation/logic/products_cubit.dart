import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:joli_crm/core/services/image_picker_service.dart';
import 'package:joli_crm/features/products/data/models/products_req_model.dart';
import 'package:joli_crm/features/products/data/models/update_product_req_model.dart';
import 'package:joli_crm/features/products/domain/entities/category_entity.dart';
import 'package:joli_crm/features/products/domain/entities/create_product_entity.dart';
import 'package:joli_crm/features/products/domain/entities/delete_product_entity.dart';
import 'package:joli_crm/features/products/domain/entities/get_all_products_entity.dart';
import 'package:joli_crm/features/products/domain/entities/get_product_by_id_entity.dart';
import 'package:joli_crm/features/products/domain/entities/product_entity.dart';
import 'package:joli_crm/features/products/domain/entities/update_product_entity.dart';
import 'package:joli_crm/features/products/domain/use_cases/create_product_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/delete_product_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/get_all_categories_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/update_product_use_case.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._imagePickerService,
    this._createProductUseCase,
    this._getAllProductsUseCase,
    this._getProductByIdUseCase,
    this._updateProductUseCase,
    this._deleteProductUseCase,
    this._allCategoriesUseCase,
  ) : super(ProductsInitial());

  final ImagePickerService _imagePickerService;
  final CreateProductUseCase _createProductUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetProductByIdUseCase _getProductByIdUseCase;
  final UpdateProductUseCase _updateProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final GetAllCategoriesUseCase _allCategoriesUseCase;

  File? image;
  bool _isLoading = false;
  int _page = 1;
  final int _limit = 20;
  bool hasMore = true;
  List<ProductEntity> products = [];
  CategoryEntity? selectedCategory;

  Future<void> pickImageFromGallery() async {
    image = await _imagePickerService.pickImageFromGallery();

    emit(ProductImagePicked(image));
  }

  Future<void> pickImageFromCamera() async {
    image = await _imagePickerService.pickImageFromCamera();

    emit(ProductImagePicked(image));
  }

  Future<void> createProduct({
    required String productName,
    required String productDescription,
    required String productSize,
    required double productPrice,
    required String categoryId,
  }) async {
    if (_isLoading) return;

    emit(CreateProductLoading());
    _isLoading = true;

    if (image == null) {
      _isLoading = false;
      emit(ProductsError("Image Is Required"));
      return;
    }

    final result = await _createProductUseCase(
      ProductsReqModel(
        productImage: image!,
        productName: productName,
        productDescription: productDescription,
        productSize: productSize,
        productPrice: productPrice,
        categoryId: categoryId,
      ),
    );

    _isLoading = false;

    result.fold((err) => emit(ProductsError(err.message)), (data) {
      emit(CreateProductSuccess(data));
    });
  }

  Future<void> getAllProducts() async {
    if (_isLoading) return;

    _isLoading = true;
    emit(GetAllProductsLoading());

    final result = await _getAllProductsUseCase(_page, _limit);

    result.fold((err) => emit(ProductsError(err.message)), (data) {
      products.addAll(data.data);

      emit(
        GetAllProductsSuccess(
          GetAllProductsEntity(
            message: data.message,
            data: List.from(products),
          ),
        ),
      );
    });

    _isLoading = false;
  }

  Future<void> loadMore() async {
    if (!hasMore || _isLoading) return;

    _isLoading = true;

    final result = await _getAllProductsUseCase(++_page, _limit);

    result.fold((err) => emit(ProductsError(err.message)), (data) {
      if (data.data.isEmpty) {
        hasMore = false;
      } else {
        products.addAll(data.data);
      }
      emit(
        GetAllProductsSuccess(
          GetAllProductsEntity(
            message: data.message,
            data: List.from(products),
          ),
        ),
      );
    });

    _isLoading = false;
  }

  Future<void> refreshProducts() async {
    _page = 1;
    hasMore = true;
    products.clear();

    await getAllProducts();
  }

  Future<void> getProductById(String id) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(GetProductByIdLoading());

    final result = await _getProductByIdUseCase(id);

    result.fold(
      (err) => emit(ProductsError(err.message)),
      (data) => emit(GetProductByIdSuccess(data)),
    );

    _isLoading = false;
  }

  Future<void> updateProduct({
    required String id,
    File? productImage,
    String? productName,
    String? productDescription,
    String? productSize,
    double? productPrice,
    String? categoryId,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(UpdateProductLoading());

    final result = await _updateProductUseCase(
      id: id,
      data: UpdateProductReqModel(
        productImage: productImage,
        productName: productName,
        productDescription: productDescription,
        productPrice: productPrice,
        productSize: productSize,
      ),
    );

    result.fold(
      (err) => emit(ProductsError(err.message)),
      (data) => emit(UpdateProductSuccess(data)),
    );
    _isLoading = false;
  }

  Future<void> deleteProduct({required String id}) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(DeleteProductLoading());

    final result = await _deleteProductUseCase(id);

    _isLoading = false;

    result.fold(
      (err) => emit(ProductsError(err.message)),
      (data) => emit(DeleteProductSuccess(data)),
    );
  }

  Future<void> getAllCategories() async {
    if (_isLoading) return;

    _isLoading = true;
    emit(GetAllCategoriesLoading());

    final result = await _allCategoriesUseCase();

    result.fold(
      (err) => emit(ProductsError(err.message)),
      (data) => emit(GetAllCategoriesSuccess(data)),
    );

    _isLoading = false;
  }

  void selectCategory(CategoryEntity category) {
    selectedCategory = category;
    emit(SelectedCategory(category));
  }
}
