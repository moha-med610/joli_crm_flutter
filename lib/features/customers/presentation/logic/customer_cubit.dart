import 'package:bloc/bloc.dart';
import 'package:joli_crm/features/customers/domain/entities/customers_res_entity.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/get_all_customers_use_case.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit(this.getAllCustomersUseCase) : super(CustomerInitial());

  final GetAllCustomersUseCase getAllCustomersUseCase;

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
}
