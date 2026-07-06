import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/core/widgets/text_form_field_widget.dart';
import 'package:joli_crm/features/products/presentation/logic/products_cubit.dart';
import 'package:joli_crm/features/products/presentation/widgets/image_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productSizeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  late final ProductsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = sl<ProductsCubit>();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    _productSizeController.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is CreateProductSuccess) {
            SnackBarWidgets.success(context, state.data.message);

            cubit.image = null;

            context.pop();
            _productNameController.clear();
            _productPriceController.clear();
            _productDescriptionController.clear();
            _productSizeController.clear();
          }
        },
        builder: (context, state) {
          return AppLayout(
            appBar: AppBarWidget(title: "add_product".tr()),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ButtonWidget(
                  child: cubit.state is CreateProductLoading
                      ? CupertinoActivityIndicator(
                          radius: 10,
                          color: Colors.white,
                        )
                      : Text(
                          "add_product".tr(),
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSecondaryContainer,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  onPressed: () {
                    cubit.createProduct(
                      productName: _productNameController.text.trim(),
                      productDescription: _productDescriptionController.text
                          .trim(),
                      productSize: _productPriceController.text.trim(),
                      productPrice: double.parse(
                        _productPriceController.text.trim(),
                      ),
                      categoryId: "6a43f35297f8fc8fa1a40532",
                    );
                  },
                ),
              ),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16.0,
                  children: [
                    ImageWidget(),
                    TextFormFieldWidget(
                      controller: _productNameController,
                      hint: "product_name".tr(),
                    ),
                    TextFormFieldWidget(
                      controller: _productDescriptionController,
                      hint: "product_description".tr(),
                    ),
                    TextFormFieldWidget(
                      controller: _productPriceController,
                      hint: "product_price".tr(),
                    ),
                    TextFormFieldWidget(
                      controller: _productSizeController,
                      hint: "product_size".tr(),
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
