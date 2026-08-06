import 'package:joli_crm/core/services/get_it_service.dart';
import 'package:joli_crm/core/services/image_picker_service.dart';
import 'package:joli_crm/features/products/data/data_source/base_products_data_source.dart';
import 'package:joli_crm/features/products/data/repos/products_repo_impl.dart';
import 'package:joli_crm/features/products/domain/repos/base_products_repo.dart';
import 'package:joli_crm/features/products/domain/use_cases/create_product_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/delete_product_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/get_all_categories_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/get_product_by_id_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:joli_crm/features/products/domain/use_cases/update_product_use_case.dart';
import 'package:joli_crm/features/products/presentation/logic/products_cubit.dart';

class ProductsDi {
  static Future<void> init() async {
    sl.registerLazySingleton<BaseProductsDataSource>(
      () => BaseProductsDataSource(sl()),
    );

    sl.registerLazySingleton<BaseProductsRepo>(() => ProductsRepoImpl(sl()));

    sl.registerLazySingleton(() => CreateProductUseCase(sl()));
    sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));
    sl.registerLazySingleton(() => GetProductByIdUseCase(sl()));
    sl.registerLazySingleton(() => UpdateProductUseCase(sl()));
    sl.registerLazySingleton(() => DeleteProductUseCase(sl()));
    sl.registerLazySingleton(() => GetAllCategoriesUseCase(sl()));

    sl.registerFactory(
      () => ProductsCubit(
        ImagePickerService(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
