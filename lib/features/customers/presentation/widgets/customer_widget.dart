import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';
import 'package:joli_crm/features/customers/presentation/screens/update_customer_screen.dart';

class CustomerWidget extends StatelessWidget {
  const CustomerWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.customerId,
    this.valueKey,
  });

  final Function()? onTap;
  final String title;
  final String subtitle;
  final String trailing;
  final ValueKey? valueKey;
  final String customerId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        borderRadius: .circular(20),
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Slidable(
            key: valueKey,
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    context.push(UpdateCustomerScreen());
                  },
                  icon: CupertinoIcons.pen,
                  label: "Update",
                  backgroundColor: Colors.blue.shade300,
                  foregroundColor: Colors.white,
                ),
                SlidableAction(
                  onPressed: (_) async {
                    await context.read<CustomerCubit>().deleteCustomer(
                      customerId: customerId,
                    );
                  },
                  icon: CupertinoIcons.delete_solid,
                  label: "Delete",
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                title,
                style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                trailing,
                style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
                  color: Colors.grey.shade900,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey.shade400, width: .5),
              ),
              contentPadding: EdgeInsets.all(14),
              tileColor: Colors.grey.shade200,
            ),
          ),
        ),
      ),
    );
  }
}
