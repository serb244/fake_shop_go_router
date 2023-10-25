import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fake_shop_go_router/features/home/presentation/manager/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/network_info.dart';
import 'features/home/data/data_sources/data_sources.dart';
import 'features/home/data/repositories/category_repository_impl.dart';
import 'features/home/domain/repositories/category_repository_impl.dart';
import 'features/home/domain/use_cases/get_categories_use_case.dart';
import 'features/product_detail/data/data_sources/product_remote_data_source.dart';
import 'features/product_detail/data/repositories/product_repository_impl.dart';
import 'features/product_detail/domain/repositories/product_repository.dart';
import 'features/product_detail/presentation/manager/product_detail_bloc.dart';
import 'features/product_list/data/repositories/products_repository_impl.dart';
import 'features/product_list/domain/repositories/products_repository.dart';
import 'features/home/domain/use_cases/use_cases.dart';
import 'features/product_list/presentation/manager/product_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! BLoC
  locator.registerFactory(
    () => ProductDetailBloc(
      getProductById: locator(),
    ),
  );
  locator.registerFactory(
    () => ProductsBloc(
      getProductById: locator(),
      getProductsByCategory: locator(),
      getProducts: locator(),
    ),
  );
  locator.registerFactory(
    () => HomeBloc(
      getCategories: locator<GetCategoriesUseCase>(),
    ),
  );

  //! UseCases
  locator.registerLazySingleton(
    () => GetCategoriesUseCase(categoryRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetProductByIdUseCase(productRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetProductByCategoryUseCase(productRepository: locator()),
  );
  locator.registerLazySingleton(
    () => GetProductsUseCase(productRepository: locator()),
  );

  //! Repositories
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      networkInfo: locator(),
      productRemoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      networkInfo: locator(),
      productRemoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      networkInfo: locator(),
      categoryRemoteDataSource: locator(),
    ),
  );

  //! Data Source
  locator.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(),
  );

  //! Core
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: locator()),
  );

  //! External Libraries
  locator.registerLazySingleton(() => Connectivity());

  //! Storage
  // locator.registerLazySingleton(() => ProductStorageRepository());
}
