import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/date_format.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/features/products/presentation/logic/products_cubit.dart';
import 'package:joli_crm/features/products/presentation/widgets/product_information_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductsCubit>()..getProductById(id),
      child: AppLayout(
        appBar: AppBarWidget(
          title: "product_details".tr(),
          color: Colors.transparent,
        ),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is GetProductByIdLoading) {
              return const SizedBox();
            }

            if (state is GetProductByIdSuccess) {
              final product = state.data.data;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ClipRRect(
                      borderRadius: .circular(20),
                      child: Container(
                        alignment: .topCenter,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .4,
                        child: CachedNetworkImage(
                          width: .infinity,
                          height: .infinity,
                          fit: .cover,
                          imageUrl: product.productImage,
                        ),
                      ),
                    ),
                  ),
                  const SliverPadding(padding: .all(10)),
                  SliverToBoxAdapter(
                    child: Column(
                      spacing: 10,
                      children: [
                        ProductInformationWidget(
                          filedName: "product_name".tr(),
                          data: product.productName,
                        ),
                        ProductInformationWidget(
                          filedName: "product_price".tr(),
                          data: product.productPrice.toString(),
                        ),
                        ProductInformationWidget(
                          filedName: "product_description".tr(),
                          data: product.productDescription,
                        ),
                        ProductInformationWidget(
                          filedName: "product_size".tr(),
                          data: product.productSize,
                        ),
                        ProductInformationWidget(
                          filedName: "product_category".tr(),
                          data: product.category.categoryName,
                        ),
                        ProductInformationWidget(
                          filedName: "created_at".tr(),
                          data: DateFormatHelper.format(
                            product.createdAt,
                            context.locale.toString(),
                          ),
                        ),
                        ProductInformationWidget(
                          filedName: "last_update".tr(),
                          data: DateFormatHelper.format(
                            product.updatedAt,
                            context.locale.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
