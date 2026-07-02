import 'dart:io';

class ProductsReqModel {
  final File productImage;
  final String productName;
  final String productDescription;
  final String productSize;
  final double productPrice;
  final String categoryId;

  ProductsReqModel({
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productSize,
    required this.productPrice,
    required this.categoryId,
  });
}
