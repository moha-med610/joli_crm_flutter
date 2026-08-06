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

final class GetProductByIdSuccess extends ProductsState {
  final GetProductByIdEntity data;

  GetProductByIdSuccess(this.data);
}

final class GetProductByIdLoading extends ProductsState {}

final class UpdateProductLoading extends ProductsState {}

final class UpdateProductSuccess extends ProductsState {
  final UpdateProductEntity data;

  UpdateProductSuccess(this.data);
}

final class DeleteProductLoading extends ProductsState {}

final class DeleteProductSuccess extends ProductsState {
  final DeleteProductEntity data;

  DeleteProductSuccess(this.data);
}

final class GetAllCategoriesSuccess extends ProductsState {
  final List<CategoryEntity> data;

  GetAllCategoriesSuccess(this.data);
}

final class GetAllCategoriesLoading extends ProductsState {}

final class SelectedCategory extends ProductsState {
  final CategoryEntity category;

  SelectedCategory(this.category);
}

final class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);
}
