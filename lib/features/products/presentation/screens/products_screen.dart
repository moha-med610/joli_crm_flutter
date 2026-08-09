import 'package:context_menu_android/context_menu_android.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/floating_button_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/products/presentation/logic/products_cubit.dart';
import 'package:joli_crm/features/products/presentation/screens/add_product_screen.dart';
import 'package:joli_crm/features/products/presentation/screens/product_details.dart';
import 'package:joli_crm/features/products/presentation/screens/update_product_screen.dart';
import 'package:joli_crm/features/products/presentation/widgets/product_card.dart';
import 'package:joli_crm/features/products/presentation/widgets/product_loading.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ScrollController _scrollController = ScrollController();

  late final ProductsCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = sl<ProductsCubit>();
    cubit.getAllProducts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        cubit.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: AppLayout(
        appBar: null,
        floatingActionButton: FloatingButtonWidget(
          onPressed: () {
            context.push(AddProductScreen(cubit: cubit));
          },
          icon: CupertinoIcons.cube,
          label: "add_product".tr(),
        ),
        child: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            if (state is ProductsError) {
              SnackBarWidgets.error(context, state.message);
            }

            if (state is DeleteProductSuccess) {
              SnackBarWidgets.success(context, state.data.message);

              cubit.refreshProducts();
            }
          },
          builder: (context, state) {
            if (state is GetAllProductsLoading) {
              return const ProductLoading();
            }

            if (state is GetAllProductsSuccess) {
              if (state.data.data.isEmpty) {
                return const Center(child: Text("No Products Found"));
              }
              return GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemCount: state.data.data.length,
                itemBuilder: (context, index) {
                  final product = state.data.data[index];

                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ContextMenuWrapper(
                      actions: [
                        ContextMenuItem(
                          icon: Icons.delete,
                          label: 'delete'.tr(),
                          onTap: () {
                            context.read<ProductsCubit>().deleteProduct(
                              id: product.id,
                            );
                          },
                        ),
                        ContextMenuItem(
                          icon: Icons.edit,
                          label: 'update'.tr(),
                          onTap: () {
                            context.push(
                              UpdateProductScreen(
                                cubit: cubit,
                                id: product.id,
                                productName: product.productName,
                                productDescription: product.productDescription,
                                productPrice: product.productPrice,
                                productSize: product.productSize,
                                productCategory: product.category.categoryName,
                              ),
                            );
                          },
                        ),
                      ],
                      child: ProductCardWidget(
                        onTap: () {
                          context.push(ProductDetails(id: product.id));
                        },
                        imageUrl: product.productImage,
                        productName: product.productName,
                        productPrice: product.productPrice.toString(),
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
    );
  }
}
