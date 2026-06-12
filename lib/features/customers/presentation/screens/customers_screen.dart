import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/navigator_helper.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/floating_button_widget.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey();

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
    return BlocProvider(
      create: (context) => sl<CustomerCubit>()..getAllCustomers(),
      child: BlocBuilder<CustomerCubit, CustomerState>(
        builder: (context, state) {
          return AppLayout(
            appBar: null,
            floatingActionButton: FloatingButtonWidget(
              icon: CupertinoIcons.add,
              label: "Add Customer",
              onPressed: () {
                customerSheet(
                  isLoading: state is CreateCustomerLoading,
                  context,
                  cNameController: _nameController,
                  cPhoneController: _phoneController,
                  cAddressController: _addressController,
                  cCityController: _cityController,
                  cWhatsappController: _whatsappController,
                  cNotsController: _notsController,
                  formKey: _formKey,
                  onSubmit: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<CustomerCubit>().createCustomer(
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
                  },
                );
              },
            ),
            child: BlocConsumer<CustomerCubit, CustomerState>(
              listener: (context, state) {
                if (state is CreateCustomerSuccess) {
                  context.pop();

                  context.read<CustomerCubit>().getAllCustomers();

                  SnackBarWidgets.success(context, state.data.message);
                }

                if (state is CustomerError) {
                  SnackBarWidgets.error(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is CustomerLoading) {
                  return CustomersLoading();
                }
                if (state is CustomersSuccess) {
                  if (state.customers.data.isEmpty) {
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
                          itemCount: state.customers.data.length,
                          itemBuilder: (context, index) {
                            final customer = state.customers.data[index];
                            return Directionality(
                              textDirection: TextDirection.ltr,
                              child: CustomerWidget(
                                title: customer.name,
                                subtitle: customer.phone,
                                trailing: customer.city,
                              ),
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
