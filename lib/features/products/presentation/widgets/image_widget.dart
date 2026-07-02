import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/buttom_sheet_widget.dart';
import 'package:joli_crm/features/products/presentation/logic/products_cubit.dart';
import 'package:joli_crm/features/products/presentation/widgets/select_image_from_widget.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final image = context.watch<ProductsCubit>().image;
    return Container(
      width: .infinity,
      alignment: .center,
      decoration: BoxDecoration(
        borderRadius: .circular(20),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          image == null
              ? SizedBox.shrink()
              : Container(
                  width: .infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(image)),
                  ),
                ),
          SizedBox(height: 5),
          InkWell(
            borderRadius: .circular(20),
            onTap: () {
              bottomSheetWidget(
                context,
                title: "select_image_from".tr(),
                children: [
                  SelectImageFromWidget(
                    title: "camera".tr(),
                    icon: CupertinoIcons.photo_camera_solid,
                    onTap: () {
                      context.read<ProductsCubit>().pickImageFromCamera();
                      context.pop();
                    },
                  ),
                  SizedBox(height: 20),
                  SelectImageFromWidget(
                    title: "photos".tr(),
                    icon: CupertinoIcons.photo_fill,
                    onTap: () {
                      context.read<ProductsCubit>().pickImageFromGallery();
                      context.pop();
                    },
                  ),
                ],
              );
            },
            child: Container(
              padding: .all(18),
              alignment: .center,
              decoration: BoxDecoration(borderRadius: .circular(20)),
              child: Row(
                children: [
                  Text(
                    "product_image".tr(),
                    style: TextStyle(fontWeight: .bold, fontSize: 20.sp),
                  ),
                  Spacer(),
                  Icon(CupertinoIcons.photo),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
