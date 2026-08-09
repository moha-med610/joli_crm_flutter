import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customer_sheet.dart';

class UpdateCustomerScreen extends StatefulWidget {
  const UpdateCustomerScreen({super.key, required this.customerId});

  final String customerId;

  @override
  State<UpdateCustomerScreen> createState() => _UpdateCustomerScreenState();
}

class _UpdateCustomerScreenState extends State<UpdateCustomerScreen> {
  bool _sheetShown = false;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBarWidget(title: "edit_customer".tr()),
      child: BlocProvider(
        create: (context) =>
            sl<CustomerCubit>()..getCustomerById(customerId: widget.customerId),
        child: BlocConsumer<CustomerCubit, CustomerState>(
          listener: (context, state) {
            if (state is CustomerError) {
              SnackBarWidgets.error(context, state.message);
            }

            if (state is UpdateCustomerSuccess) {
              SnackBarWidgets.success(context, state.data.message);
              Navigator.of(context).pop(true);
            }
          },
          builder: (context, state) {
            if (state is CustomerLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is CustomerSuccess) {
              final customer = state.data.data;

              // Show the update sheet only once
              if (!_sheetShown) {
                _sheetShown = true;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showUpdateSheet(context, customer);
                });
              }
              return const SizedBox.shrink();
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showUpdateSheet(BuildContext context, dynamic customer) {
    customerSheet(
      context,
      header: "edit_customer".tr(),
      buttonText: "update".tr(),
      initialName: customer.name,
      initialPhone: customer.phone,
      initialAddress: customer.address,
      initialCity: customer.city,
      initialWhatsapp: customer.whatsapp,
      initialNotes: customer.notes,
      isLoading: context.read<CustomerCubit>().state is CustomerLoading,
      onSubmit:
          ({
            required String name,
            required String phone,
            String? whatsapp,
            required String address,
            required String city,
            String? notes,
          }) async {
            await context.read<CustomerCubit>().updateCustomer(
              customerId: widget.customerId,
              name: name,
              phone: phone,
              whatsapp: whatsapp,
              address: address,
              city: city,
              notes: notes,
            );
          },
    );
  }
}
