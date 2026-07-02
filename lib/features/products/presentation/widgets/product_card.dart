import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/logic/app_cubit.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    this.onTap,
  });

  final String imageUrl;
  final String productName;
  final String productPrice;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  theme.brightness == Brightness.dark ? .35 : .08,
                ),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: .circular(20),
                    bottom: .circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: 170.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: double.infinity,
                      height: 170.h,
                      color: colorScheme.surfaceContainer,
                      child: const Center(child: CupertinoActivityIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: double.infinity,
                      height: 170.h,
                      color: colorScheme.surfaceContainer,
                      child: Center(
                        child: Icon(
                          Icons.broken_image_outlined,
                          size: 40.sp,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    BlocBuilder<AppCubit, AppState>(
                      builder: (context, state) {
                        final isDark = context.watch<AppCubit>().state.isDark;
                        return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "$productPrice ",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                  color: isDark
                                      ? colorScheme.secondary
                                      : colorScheme.primary,
                                ),
                              ),
                              TextSpan(
                                text: "EGP",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
