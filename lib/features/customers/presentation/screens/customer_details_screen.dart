import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/widgets/app_bar_widget.dart';
import 'package:joli_crm/core/widgets/app_layout.dart';
import 'package:joli_crm/core/widgets/snack_bar_widgets.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customer_card_widget.dart';
import 'package:joli_crm/features/customers/presentation/widgets/customer_information_widget.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key, required this.customerId});

  final String customerId;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBar: AppBarWidget(title: "Customer Details"),
      child: BlocProvider(
        create: (context) =>
            sl<CustomerCubit>()..getCustomerById(customerId: customerId),
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
            if (state is CustomerLoading) {
              return Center(child: CupertinoActivityIndicator());
            }

            if (state is CustomerSuccess) {
              final customer = state.data.data;
              return SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    CustomerCardWidget(
                      header: "Personal Information",
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "Customer Name",
                          data: customer.name,
                        ),
                      ],
                    ),
                    CustomerCardWidget(
                      header: "Contact Details",
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "Phone Number",
                          data: customer.phone,
                        ),
                        SizedBox(height: 10),
                        CustomerInformationWidget(
                          fieldName: "Whatsapp",
                          data: customer.whatsapp ?? "---",
                        ),
                      ],
                    ),
                    CustomerCardWidget(
                      header: "Location",
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "Address",
                          data: customer.address,
                        ),
                        SizedBox(height: 10),
                        CustomerInformationWidget(
                          fieldName: "City",
                          data: customer.city,
                        ),
                      ],
                    ),
                    CustomerCardWidget(
                      header: "Additional Information",
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "notes",
                          data: customer.notes ?? "---",
                        ),
                      ],
                    ),
                    CustomerCardWidget(
                      header: "More",
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "Created At",
                          data: customer.createdAt.toLocal().toString(),
                        ),
                        SizedBox(height: 10),
                        CustomerInformationWidget(
                          fieldName: "Last Update",
                          data: customer.updatedAt.toLocal().toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

/**
 * Container(
    padding: .all(10),
    width: double.infinity,
    decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: .circular(20),
    border: BoxBorder.all(
    color: Colors.grey.shade400,
    width: 0.5,
    ),
    ),
    child: Column(
    crossAxisAlignment: .start,
    children: [
    Text(
    "Personal Information",
    style: Theme.of(
    context,
    ).primaryTextTheme.headlineLarge,
    ),
    SizedBox(height: 10),
    Text(
    "Customer Name",
    style: Theme.of(context).primaryTextTheme.labelMedium!
    .copyWith(fontWeight: .bold),
    ),
    Container(
    padding: .all(10),
    width: double.infinity,
    constraints: BoxConstraints(
    maxWidth: .infinity,
    maxHeight: 100,
    ),
    decoration: BoxDecoration(
    borderRadius: .circular(10),
    color: Colors.grey.shade300,
    ),
    child: Text(
    customer.name,
    style: Theme.of(context)
    .primaryTextTheme
    .labelMedium!
    .copyWith(fontWeight: .bold, fontSize: 18),
    ),
    ),
    ],
    ),
    ),
 */
