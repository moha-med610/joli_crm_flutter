import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:joli_crm/core/services/image_picker_service.dart';
import 'package:joli_crm/features/products/data/models/products_req_model.dart';
import 'package:joli_crm/features/products/domain/entities/create_product_entity.dart';
import 'package:joli_crm/features/products/domain/entities/get_all_products_entity.dart';
import 'package:joli_crm/features/products/domain/use_cases/create_product_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._imagePickerService,
    this._createProductUseCase,
    this._getAllProductsUseCase,
  ) : super(ProductsInitial());

  final ImagePickerService _imagePickerService;
  final CreateProductUseCase _createProductUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;

  File? image;
  bool _isLoading = false;
  final int _page = 1;
  final int _limit = 20;

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

    if (image == null) return;

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

    result.fold((err) => emit(ProductsError(err.message)), (data) {
      emit(CreateProductSuccess(data));
    });

    _isLoading = false;
  }

  Future<void> getAllProducts() async {
    if (_isLoading) return;

    _isLoading = true;
    emit(GetAllProductsLoading());

    final result = await _getAllProductsUseCase(_page, _limit);

    result.fold(
      (err) => emit(ProductsError(err.message)),
      (data) => emit(GetAllProductsSuccess(data)),
    );

    _isLoading = false;
  }
}
