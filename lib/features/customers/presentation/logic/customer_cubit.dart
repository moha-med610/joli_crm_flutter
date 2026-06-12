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

  Future<void> getAllCustomers() async {
    if (_isLoading) return;

    _isLoading = true;
    emit(CustomerLoading());

    final result = await getAllCustomersUseCase();

    result.fold(
      (err) => emit(CustomerError(err.message)),
      (data) => emit(CustomersSuccess(data)),
    );

    _isLoading = false;
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
