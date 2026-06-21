import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/features/customers/data/data_source/customers_data_source.dart';
import 'package:joli_crm/features/customers/data/repo/customer_repo_impl.dart';
import 'package:joli_crm/features/customers/domain/repo/base_customer_repo.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/create_customer_use_case.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/delete_customer_use_case.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/get_all_customers_use_case.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/get_customer_by_id_use_case.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/search_customers_use_case.dart';
import 'package:joli_crm/features/customers/domain/use_csaes/update_customer_use_case.dart';
import 'package:joli_crm/features/customers/presentation/logic/customer_cubit.dart';

class CustomersDi {
  static Future<void> init() async {
    sl.registerLazySingleton<CustomersDataSource>(
      () => CustomersDataSource(sl()),
    );

    sl.registerLazySingleton<BaseCustomerRepo>(() => CustomerRepoImpl(sl()));

    sl.registerLazySingleton(() => GetAllCustomersUseCase(sl()));
    sl.registerLazySingleton(() => CreateCustomerUseCase(sl()));
    sl.registerLazySingleton(() => GetCustomerByIdUseCase(sl()));
    sl.registerLazySingleton(() => UpdateCustomerUseCase(sl()));
    sl.registerLazySingleton(() => DeleteCustomerUseCase(sl()));
    sl.registerLazySingleton(() => SearchCustomersUseCase(sl()));

    sl.registerFactory(() => CustomerCubit(sl(), sl(), sl(), sl(), sl(), sl()));
  }
}
