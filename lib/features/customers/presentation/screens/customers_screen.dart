import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/button_widget.dart';
import 'package:joli_crm/core/widgets/floating_button_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';
import 'package:joli_crm/features/customers/presentation/screens/customer_details_screen.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customer_sheet.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customer_widget.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customers_loading.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _notsController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  late final CustomerCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = sl<CustomerCubit>();
    cubit.getAllCustomers();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        cubit.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _whatsappController.dispose();
    _notsController.dispose();

    _scrollController.dispose();
    cubit.close();
    super.dispose();
  }

  void _formSubmit() {
    customerSheet(
      header: "Add New Customer",
      isLoading: cubit.state is CreateCustomerLoading,
      context,
      buttonText: "Add Customer",
      cNameController: _nameController,
      cPhoneController: _phoneController,
      cAddressController: _addressController,
      cCityController: _cityController,
      cWhatsappController: _whatsappController,
      cNotsController: _notsController,
      formKey: _formKey,
      onSubmit: () {
        if (_formKey.currentState!.validate()) {
          cubit.createCustomer(
            name: _nameController.text.trim(),
            phone: _phoneController.text.trim(),
            address: _addressController.text.trim(),
            city: _cityController.text.trim(),
            whatsapp: _whatsappController.text.trim().isEmpty
                ? null
                : _whatsappController.text.trim(),
            notes: _notsController.text.trim().isEmpty
                ? null
                : _notsController.text.trim(),
          );
          _nameController.clear();
          _phoneController.clear();
          _addressController.clear();
          _cityController.clear();
          _whatsappController.clear();
          _notsController.clear();
        } else {
          context.pop();
        }
        context.pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<CustomerCubit, CustomerState>(
        builder: (context, state) {
          return AppLayout(
            appBar: null,
            floatingActionButton: FloatingButtonWidget(
              icon: CupertinoIcons.add,
              label: "Add Customer",
              onPressed: _formSubmit,
            ),
            child: BlocConsumer<CustomerCubit, CustomerState>(
              listener: (context, state) {
                if (state is CreateCustomerSuccess) {
                  cubit.refreshCustomers();

                  SnackBarWidgets.success(context, state.data.message);
                }

                if (state is CustomerError) {
                  SnackBarWidgets.error(context, state.message);
                }

                if (state is DeleteCustomerSuccess) {
                  context.read<CustomerCubit>().refreshCustomers();

                  SnackBarWidgets.success(context, state.data.message);
                }

                if (state is UpdateCustomerSuccess) {
                  context.read<CustomerCubit>().refreshCustomers();

                  SnackBarWidgets.success(context, state.data.message);
                }
              },
              builder: (context, state) {
                final hasMore = cubit.hasMore;
                if (state is CustomerError) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          state.message,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineLarge!
                              .copyWith(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 20),
                        ButtonWidget(
                          width: MediaQuery.sizeOf(context).width * .3,
                          child: Text(
                            "Reload",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .labelMedium!
                                .copyWith(color: Colors.white),
                          ),
                          onPressed: () async {
                            await context
                                .read<CustomerCubit>()
                                .getAllCustomers();
                          },
                        ),
                      ],
                    ),
                  );
                }

                if (state is CustomerLoading) {
                  return CustomersLoading();
                }
                if (state is CustomersSuccess) {
                  if (state.customers.isEmpty) {
                    return Center(
                      child: Text(
                        "No Customers",
                        style: Theme.of(context).primaryTextTheme.headlineLarge!
                            .copyWith(color: Colors.grey),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: state.customers.length + (hasMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == state.customers.length) {
                              return const Padding(
                                padding: EdgeInsets.all(16),
                                child: Center(
                                  child: CupertinoActivityIndicator(),
                                ),
                              );
                            }
                            final customer = state.customers[index];
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
                                  CustomerDetailsScreen(
                                    customerId: customer.id,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                }

                return SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}
