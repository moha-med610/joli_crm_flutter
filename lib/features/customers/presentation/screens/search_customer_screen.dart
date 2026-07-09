import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';
import 'package:joli_crm/features/customers/presentation/screens/customer_details_screen.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customer_widget.dart';

class SearchCustomerScreen extends StatefulWidget {
  const SearchCustomerScreen({super.key});

  @override
  State<SearchCustomerScreen> createState() => _SearchCustomerScreenState();
}

class _SearchCustomerScreenState extends State<SearchCustomerScreen> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearch(BuildContext context, String value) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final text = value.trim();

      if (text.isNotEmpty && context.mounted) {
        context.read<CustomerCubit>().searchCustomers(name: text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CustomerCubit>(),
      child: Builder(
        builder: (context) {
          return AppLayout(
            appBar: AppBar(
              titleSpacing: 0,
              title: Container(
                padding: const .symmetric(horizontal: 20),
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) => _onSearch(context, value),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "find_customers".tr(),
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            child: BlocConsumer<CustomerCubit, CustomerState>(
              listener: (context, state) {
                if (state is CustomerError) {
                  SnackBarWidgets.error(context, state.message);
                }

                if (state is DeleteCustomerSuccess) {
                  SnackBarWidgets.success(context, state.data.message);

                  context.read<CustomerCubit>().refreshSearch();
                }

                if (state is UpdateCustomerSuccess) {
                  SnackBarWidgets.success(context, state.data.message);

                  context.read<CustomerCubit>().refreshSearch();
                }
              },
              builder: (context, state) {
                if (state is SearchCustomersLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is SearchCustomersSuccess) {
                  if (state.data.data.isEmpty) {
                    return Center(
                      child: Text(
                        "no_customer_found".tr(),
                        style: const TextStyle(fontWeight: .bold, fontSize: 20),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.data.data.length,
                    itemBuilder: (context, index) {
                      final customer = state.data.data[index];

                      return CustomerWidget(
                        name: customer.name,
                        phone: customer.phone,
                        whatsapp: customer.whatsapp,
                        address: customer.address,
                        city: customer.city,
                        notes: customer.notes,
                        customerId: customer.id,
                        title: customer.name,
                        subtitle: customer.phone,
                        trailing: customer.city,
                        onTap: () {
                          context.push(
                            CustomerDetailsScreen(customerId: customer.id),
                          );
                        },
                      );
                    },
                  );
                }
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search, size: 80, color: Colors.grey.shade400),
                      const SizedBox(height: 12),
                      Text(
                        "search_for_customer".tr(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
