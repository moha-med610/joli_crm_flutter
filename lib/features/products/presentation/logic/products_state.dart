part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductImagePicked extends ProductsState {
  final File? image;

  ProductImagePicked(this.image);
}

final class GetAllProductsLoading extends ProductsState {}

final class GetAllProductsSuccess extends ProductsState {
  final GetAllProductsEntity data;

  GetAllProductsSuccess(this.data);
}

final class CreateProductLoading extends ProductsState {}

final class CreateProductSuccess extends ProductsState {
  final CreateProductEntity data;

  CreateProductSuccess(this.data);
}

final class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);
}
