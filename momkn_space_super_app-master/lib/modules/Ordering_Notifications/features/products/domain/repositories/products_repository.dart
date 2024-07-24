import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/brand_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/catalog_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sub_category_entity.dart';

import '../entities/sku_entity.dart';
abstract class ProductsRepository {
  Future<Either<Failure, List<CatalogEntity>>> getCatalosCategoriesSubCategories();
  Future<Either<Failure, List<BrandEntity>>> getBrands(SubCategoryEntity subCategoryEntity);
  Future<Either<Failure, List<SKUEntity>>> getSKUs(BrandEntity brandEntity);
}
