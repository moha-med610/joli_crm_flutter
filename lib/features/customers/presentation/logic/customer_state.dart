part of 'customer_cubit.dart';

class CustomerState {}

final class CustomerInitial extends CustomerState {}

final class CustomerLoading extends CustomerState {}

final class CustomersSuccess extends CustomerState {
  final List<Customers> customers;

  CustomersSuccess(this.customers);
}

final class CustomerSuccess extends CustomerState {
  final SingleCustomer data;

  CustomerSuccess(this.data);
}

final class CreateCustomerLoading extends CustomerState {}

final class CreateCustomerSuccess extends CustomerState {
  final SingleCustomer data;

  CreateCustomerSuccess(this.data);
}

final class DeleteCustomerSuccess extends CustomerState {
  final DeleteCustomer data;

  DeleteCustomerSuccess(this.data);
}

final class UpdateCustomerSuccess extends CustomerState {
  final SingleCustomer data;

  UpdateCustomerSuccess(this.data);
}

final class CustomerError extends CustomerState {
  final String message;

  CustomerError(this.message);
}
