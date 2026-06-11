import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerCubit>()..getAllCustomers(),
      child: BlocConsumer<CustomerCubit, CustomerState>(
        listener: (context, state) {
          if (state is CustomerError) {
            SnackBarWidgets.error(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is CustomersSuccess) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.customers.data.length,
                    itemBuilder: (context, index) {
                      final customer = state.customers.data[index];
                      return ListTile(
                        title: Text(customer.name),
                        subtitle: Text(customer.phone),
                        trailing: Text(customer.city),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                ButtonWidget(child: Text("Add Customer"), onPressed: () {}),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
