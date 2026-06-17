import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';

class UpdateCustomerScreen extends StatefulWidget {
  const UpdateCustomerScreen({super.key});

  // final String id;

  @override
  State<UpdateCustomerScreen> createState() => _UpdateCustomerScreenState();
}

class _UpdateCustomerScreenState extends State<UpdateCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerCubit>(),
      child: AppLayout(
        appBar: AppBarWidget(title: "Edit Customer"),
        child: BlocConsumer<CustomerCubit, CustomerState>(
          listener: (context, state) {
            if (state is CustomerError) {
              SnackBarWidgets.error(context, state.message);
            }

            if (state is CustomerSuccess) {
              SnackBarWidgets.success(context, state.data.message);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                // TextFormFieldWidget(controller: controller, hint: hint)
              ],
            );
          },
        ),
      ),
    );
  }
}
