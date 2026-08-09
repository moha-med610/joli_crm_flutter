import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/text_form_field_widget.dart';
import 'package:joli_crm/features/products/presentation/logic/products_cubit.dart';
import 'package:joli_crm/features/products/presentation/widgets/show_category_widget.dart';
import 'package:joli_crm/features/products/presentation/widgets/update_image_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';

import '../widgets/categories_widget.dart';

class UpdateProductScreen extends StatefulWidget {
  final ProductsCubit? cubit;
  const UpdateProductScreen({
    super.key,
    this.cubit,
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productSize,
    required this.productCategory,
  });

  final String id;
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productSize;
  final String productCategory;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  late TextEditingController _productNameController;
  late TextEditingController _productDescriptionController;
  late TextEditingController _productPriceController;
  late TextEditingController _productSizeController;

  late final ProductsCubit cubit;
  late final bool _shouldCloseCubit;

  @override
  void initState() {
    _productNameController = TextEditingController(text: widget.productName);
    _productDescriptionController = TextEditingController(
      text: widget.productDescription,
    );
    _productPriceController = TextEditingController(
      text: widget.productPrice.toString(),
    );
    _productSizeController = TextEditingController(text: widget.productSize);

    if (widget.cubit != null) {
      cubit = widget.cubit!;
      _shouldCloseCubit = false;
    } else {
      cubit = sl<ProductsCubit>();
      _shouldCloseCubit = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    _productSizeController.dispose();
    if (_shouldCloseCubit) {
      cubit.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is ProductsError) {
            SnackBarWidgets.error(context, state.message);
          }

          if (state is UpdateProductSuccess) {
            cubit.image = null;

            cubit.refreshProducts();
            SnackBarWidgets.success(context, state.data.message);

            context.pop();
          }
        },
        builder: (context, state) {
          final category = context.watch<ProductsCubit>().selectedCategory;
          return AppLayout(
            appBar: AppBarWidget(title: "update_product".tr()),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ButtonWidget(
                  child: Text(
                    "update_product".tr(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    log(state.toString());
                    context.read<ProductsCubit>().updateProduct(
                      id: widget.id,
                      productImage: context.read<ProductsCubit>().image,
                      productName: _productNameController.text.trim(),
                      productSize: _productSizeController.text.trim(),
                      productPrice: double.tryParse(
                        _productPriceController.text.trim(),
                      ),
                      productDescription: _productDescriptionController.text
                          .trim(),
                      categoryId: category?.id,
                    );
                  },
                ),
              ),
            ),
            child: Column(
              spacing: 10,
              children: [
                const UpdateImageWidget(),
                TextFormFieldWidget(
                  controller: _productNameController,
                  hint: "product_name".tr(),
                ),
                TextFormFieldWidget(
                  controller: _productDescriptionController,
                  hint: "product_description".tr(),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        controller: _productPriceController,
                        hint: "product_price".tr(),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldWidget(
                        controller: _productSizeController,
                        hint: "product_size".tr(),
                      ),
                    ),
                  ],
                ),
                CategoriesWidget(
                  onTap: () => showCategories(context, cubit),
                  category: category?.categoryName ?? widget.productCategory,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
