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
import 'package:joli_crm/features/products/presentation/widgets/categories_widget.dart';
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

  void _showCategories(BuildContext context) {
    cubit.getAllCategories();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "choose_category".tr(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 20),

                BlocProvider.value(
                  value: cubit,
                  child: BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is GetAllCategoriesLoading) {
                        return const Center(
                          child: CupertinoActivityIndicator(radius: 15),
                        );
                      }
                      if (state is GetAllCategoriesSuccess) {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                                childAspectRatio: 3.5,
                              ),
                          itemBuilder: (_, index) {
                            final category = state.data[index];
                            return InkWell(
                              onTap: () {
                                context.read<ProductsCubit>().selectCategory(
                                  category,
                                );
                                Navigator.pop(context);
                              },
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Theme.of(context).colorScheme.surface,
                                  border: Border.all(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.outline,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  category.categoryName.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is CreateProductSuccess) {
            cubit.image = null;

            SnackBarWidgets.success(context, state.data.message);

            context.pop();
            _productNameController.clear();
            _productPriceController.clear();
            _productDescriptionController.clear();
            _productSizeController.clear();

            context.read<ProductsCubit>().refreshProducts();
          }
        },
        builder: (context, state) {
          final category = context.watch<ProductsCubit>().selectedCategory;
          return AppLayout(
            appBar: AppBarWidget(title: "add_product".tr()),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ButtonWidget(
                  child: cubit.state is CreateProductLoading
                      ? const CupertinoActivityIndicator(
                          radius: 10,
                          color: Colors.white,
                        )
                      : Text(
                          "add_product".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  onPressed: () {
                    cubit.createProduct(
                      productName: _productNameController.text.trim(),
                      productDescription: _productDescriptionController.text
                          .trim(),
                      productSize: _productSizeController.text.trim(),
                      productPrice: double.parse(
                        _productPriceController.text.trim(),
                      ),
                      categoryId: category?.id ?? "",
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
                    const ImageWidget(),
                    TextFormFieldWidget(
                      controller: _productNameController,
                      hint: "product_name".tr(),
                    ),
                    TextFormFieldWidget(
                      controller: _productDescriptionController,
                      hint: "product_description".tr(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: _productPriceController,
                            hint: "product_price".tr(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: _productSizeController,
                            hint: "product_size".tr(),
                          ),
                        ),
                      ],
                    ),
                    CategoriesWidget(
                      onTap: () => _showCategories(context),
                      category: category?.categoryName,
                    ),
                    const SizedBox(height: 30.0),
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
