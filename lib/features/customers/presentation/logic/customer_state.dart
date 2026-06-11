part of 'customer_cubit.dart';

class CustomerState {}

final class CustomerInitial extends CustomerState {}

final class CustomerLoading extends CustomerState {}

final class CustomersSuccess extends CustomerState {
  final AllCustomers customers;

  CustomersSuccess(this.customers);
}

final class CustomerSuccess extends CustomerState {
  final Customers customer;

  CustomerSuccess(this.customer);
}

final class CustomerError extends CustomerState {
  final String message;

  CustomerError(this.message);
}
