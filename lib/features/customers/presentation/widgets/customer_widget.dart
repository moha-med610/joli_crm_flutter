import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customer_sheet.dart';

class CustomerWidget extends StatelessWidget {
  const CustomerWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.customerId,
    required this.name,
    required this.phone,
    this.whatsapp,
    required this.address,
    required this.city,
    this.notes,
  });

  final Function()? onTap;
  final String title;
  final String subtitle;
  final String trailing;
  final String customerId;
  final String name;
  final String phone;
  final String? whatsapp;
  final String address;
  final String city;
  final String? notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        borderRadius: .circular(10),
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Slidable(
            closeOnScroll: true,
            dragStartBehavior: .start,
            key: ValueKey(customerId),
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    final cubit = context.read<CustomerCubit>();
                    customerSheet(
                      context,
                      header: "update_customer".tr(),
                      initialName: name,
                      initialPhone: phone,
                      initialAddress: address,
                      initialCity: city,
                      initialWhatsapp: whatsapp,
                      initialNotes: notes,
                      onSubmit:
                          ({
                            required String name,
                            required String phone,
                            String? whatsapp,
                            required String address,
                            required String city,
                            String? notes,
                          }) async {
                            cubit.updateCustomer(
                              customerId: customerId,
                              name: name.isEmpty ? this.name : name,
                              phone: phone.isEmpty ? this.phone : phone,
                              whatsapp: whatsapp,
                              address: address.isEmpty ? this.address : address,
                              city: city.isEmpty ? this.city : city,
                              notes: notes,
                            );
                          },
                      buttonText: "update_customer".tr(),
                    );
                  },
                  icon: CupertinoIcons.pen,
                  label: "update".tr(),
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
                  label: "delete".tr(),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(fontSize: 22.sp, fontWeight: .bold),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                trailing,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: .3, color: Colors.grey.shade600),
              ),
              contentPadding: const EdgeInsets.all(14),
              tileColor: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}
