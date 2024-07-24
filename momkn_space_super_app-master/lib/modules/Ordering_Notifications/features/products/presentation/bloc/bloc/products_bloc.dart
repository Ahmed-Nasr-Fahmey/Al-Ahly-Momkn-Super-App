import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/datasources/products_remote_data_source.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/repositories/products_repository_impl.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/brand_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/catalog_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sku_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sub_category_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/usecases/get_brands_usecase.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/usecases/get_catalogs_categories_subcategories_usecase.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/usecases/get_skus_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {});

    on<GetCatalogsCategoriesSubCategoriesEvent>(
      (event, emit) async {
        emit(GetCatalogsCategoriesSubCategoriesLoadingState());
        GetCatalogsCategoriesSubCategriesUsecase getCatalogsCategoriesSubCategriesUsecase = GetCatalogsCategoriesSubCategriesUsecase(
            productsRepository: ProductsRepositoryImpl(productsRemoteDataSource: ProductsRemoteDataSourceImplWithDio()));
        final either = await getCatalogsCategoriesSubCategriesUsecase.call();
        either.fold((l) {
          emit(GetCatalogsCategoriesSubCategoriesErrorState(message: l.message));
        }, (r) {
          log("fel blocccc ${r.first.catalogName}");
          emit(GetCatalogsCategoriesSubCategoriesSuccessState(catalogs: r));
        });
      },
    );

    on<GetBrandsWithSKUsEvent>(
          (event, emit) async {
        emit(GetBrandsWithSKUsLoadingState());
        GetBrandsUsecase getBrandsUsecase = GetBrandsUsecase(
            productsRepository: ProductsRepositoryImpl(productsRemoteDataSource: ProductsRemoteDataSourceImplWithDio()));
        final either = await getBrandsUsecase.call(event.subCategoryEntity);
        either.fold((l) {
          emit(GetBrandsWithSKUsErrorState(message: l.message));
        }, (r) {
          log("fel blocccc");
          emit(GetBrandsWithSKUsSuccessState(brands: r));
        });
      },
    );

    on<GetSKUsEvent>(
          (event, emit) async {
        emit(GetSKUsLoadingState());
        GetSKUsUsecase getSKUsUsecase = GetSKUsUsecase(
            productsRepository: ProductsRepositoryImpl(productsRemoteDataSource: ProductsRemoteDataSourceImplWithDio()));
        final either = await getSKUsUsecase.call(event.brand);
        either.fold((l) {
          emit(GetSKUsErrorState(message: l.message));
        }, (r) {
          log("fel blocccc");
          emit(GetSKUsSuccessState(skus: r));
        });
      },
    );
  }
}
