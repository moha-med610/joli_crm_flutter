import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/utils/date_format.dart';
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
      appBar: AppBarWidget(title: "customer_details".tr()),
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
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is CustomerSuccess) {
              final customer = state.data.data;
              return SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    CustomerCardWidget(
                      header: "personal_info".tr(),
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "customer_name".tr(),
                          data: customer.name,
                        ),
                      ],
                    ),
                    CustomerCardWidget(
                      header: "contact_details".tr(),
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "phone".tr(),
                          data: customer.phone,
                        ),
                        const SizedBox(height: 10),
                        CustomerInformationWidget(
                          fieldName: "whatsapp".tr(),
                          data: customer.whatsapp ?? "",
                        ),
                      ],
                    ),
                    CustomerCardWidget(
                      header: "location".tr(),
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "address".tr(),
                          data: customer.address,
                        ),
                        const SizedBox(height: 10),
                        CustomerInformationWidget(
                          fieldName: "city".tr(),
                          data: customer.city,
                        ),
                      ],
                    ),
                    CustomerCardWidget(
                      header: "additional_info".tr(),
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "notes".tr(),
                          data: customer.notes ?? "",
                        ),
                      ],
                    ),
                    CustomerCardWidget(
                      header: "more".tr(),
                      fields: [
                        CustomerInformationWidget(
                          fieldName: "created_at".tr(),
                          data: DateFormatHelper.format(
                            customer.createdAt,
                            context.locale.toString(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomerInformationWidget(
                          fieldName: "last_update".tr(),
                          data: DateFormatHelper.format(
                            customer.updatedAt,
                            context.locale.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
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
