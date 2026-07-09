import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customer_sheet.dart';

class CustomerWidget extends StatefulWidget {
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
  State<CustomerWidget> createState() => _CustomerWidgetState();
}

class _CustomerWidgetState extends State<CustomerWidget> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _cityController;
  late final TextEditingController _whatsappController;
  late final TextEditingController _notsController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _whatsappController = TextEditingController(text: widget.whatsapp);
    _addressController = TextEditingController(text: widget.address);
    _cityController = TextEditingController(text: widget.city);
    _notsController = TextEditingController(text: widget.notes);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _whatsappController.dispose();
    _notsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        borderRadius: .circular(20),
        onTap: widget.onTap,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Slidable(
            closeOnScroll: true,
            key: ValueKey(widget.customerId),
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    print(widget.phone);
                    customerSheet(
                      header: "update_customer".tr(),
                      context,
                      onSubmit: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<CustomerCubit>().updateCustomer(
                            customerId: widget.customerId,
                            name: _nameController.text.trim().isEmpty
                                ? widget.name
                                : _nameController.text.trim(),
                            phone: _phoneController.text.trim().isEmpty
                                ? widget.phone
                                : _phoneController.text.trim(),
                            whatsapp: _whatsappController.text.trim().isEmpty
                                ? null
                                : _whatsappController.text.trim(),
                            address: _addressController.text.trim().isEmpty
                                ? widget.address
                                : _addressController.text.trim(),
                            city: _cityController.text.trim().isEmpty
                                ? widget.city
                                : _cityController.text.trim(),
                            notes: _notsController.text.trim().isEmpty
                                ? null
                                : _notsController.text.trim(),
                          );
                        } else {
                          context.pop();
                        }
                        context.pop();
                      },
                      buttonText: "update_customer".tr(),
                      cNameController: _nameController,
                      cPhoneController: _phoneController,
                      cAddressController: _addressController,
                      cCityController: _cityController,
                      cWhatsappController: _whatsappController,
                      cNotsController: _notsController,
                      formKey: _formKey,
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
                      customerId: widget.customerId,
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
                widget.title,
                style: TextStyle(fontSize: 22.sp, fontWeight: .bold),
              ),
              subtitle: Text(
                widget.subtitle,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                widget.trailing,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
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
