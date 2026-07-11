import 'dart:io';

class UpdateProductReqModel {
  final File? productImage;
  final String? productName;
  final String? productDescription;
  final String? productSize;
  final double? productPrice;
  final String? categoryId;

  UpdateProductReqModel({
    this.productImage,
    this.productName,
    this.productDescription,
    this.productSize,
    this.productPrice,
    this.categoryId,
  });
}
