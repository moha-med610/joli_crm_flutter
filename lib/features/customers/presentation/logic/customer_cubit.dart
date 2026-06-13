import 'package:bloc/bloc.dart';
import 'package:joli_crm/features/customers/data/models/create_customer_model.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/create_customer_use_case.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/get_all_customers_use_case.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit(this.getAllCustomersUseCase, this.createCustomerUseCase)
    : super(CustomerInitial());

  final GetAllCustomersUseCase getAllCustomersUseCase;
  final CreateCustomerUseCase createCustomerUseCase;

  bool _isLoading = false;
  int page = 1;
  int limit = 20;
  final List<Customers> customers = [];
  bool hasMore = true;

  Future<void> getAllCustomers() async {
    if (_isLoading) return;

    _isLoading = true;
    emit(CustomerLoading());

    final result = await getAllCustomersUseCase(page: page, limit: limit);

    result.fold((err) => emit(CustomerError(err.message)), (data) {
      customers.addAll(data.data);
      emit(CustomersSuccess(List.from(customers)));
    });

    _isLoading = false;
  }

  Future<void> loadMore() async {
    if (!hasMore || _isLoading) return;

    _isLoading = true;

    final result = await getAllCustomersUseCase(page: ++page, limit: limit);

    result.fold((e) => emit(CustomerError(e.message)), (data) {
      if (data.data.isEmpty) {
        hasMore = false;
      } else {
        customers.addAll(data.data);
      }
      emit(CustomersSuccess(List.from(customers)));
    });

    _isLoading = false;
  }

  Future<void> refreshCustomers() async {
    page = 1;
    hasMore = true;
    customers.clear();

    await getAllCustomers();
  }

  Future<void> createCustomer({
    required String name,
    required String phone,
    required String address,
    required String city,
    String? whatsapp,
    String? notes,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(CreateCustomerLoading());

    final result = await createCustomerUseCase(
      CreateCustomerModel(
        name: name,
        phone: phone,
        address: address,
        city: city,
        whatsapp: whatsapp,
        notes: notes,
      ),
    );

    result.fold((err) => emit(CustomerError(err.message)), (data) {
      emit(CreateCustomerSuccess(data));
    });

    _isLoading = false;
  }
}
