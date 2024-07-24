import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/cache_helper.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/datasources/products_remote_data_source.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/brand_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/catalog_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sub_category_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/repositories/products_repository.dart';

import '../../domain/entities/sku_entity.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepositoryImpl({required this.productsRemoteDataSource});

  @override
  Future<Either<Failure, List<CatalogEntity>>> getCatalosCategoriesSubCategories() async {
    try {
      List<CatalogEntity> val = [];
      final catalogsCached = await CacheHelper.containsKey("catalogs_key");
      if(catalogsCached){
        val = await CacheHelper.getCachedCatalogs() ;
        log(val.length.toString());
      }
      else{
        val = await productsRemoteDataSource.getCatalosCategoriesSubCategories();

      }
      return Right(val);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Error Getting Catalogs'));
    }
  }

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands(SubCategoryEntity subCategoryEntity) async{
    try {
      final val = await productsRemoteDataSource.getBrands(subCategoryEntity);
      return Right(val);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Error Getting Brands'));
    }
  }

  @override
  Future<Either<Failure, List<SKUEntity>>> getSKUs(BrandEntity brandEntity)async {
    try {
      final val = await productsRemoteDataSource.getSKUs(brandEntity);
      return Right(val);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: 'Error Getting SKUs'));
    }
  }
}
