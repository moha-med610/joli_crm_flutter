import 'package:flutter/material.dart';
import 'package:joli_crm/features/products/presentation/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const Skeletonizer(
          child: ProductCardWidget(
            imageUrl: "",
            productName: "",
            productPrice: "",
          ),
        );
      },
    );
  }
}
