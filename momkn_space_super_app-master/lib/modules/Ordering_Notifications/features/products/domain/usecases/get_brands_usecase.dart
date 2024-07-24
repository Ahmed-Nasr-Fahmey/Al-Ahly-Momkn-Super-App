import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/brand_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sub_category_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/repositories/products_repository.dart';

class GetBrandsUsecase {
  final ProductsRepository productsRepository;

  GetBrandsUsecase({required this.productsRepository});
  Future<Either<Failure, List<BrandEntity>>> call(SubCategoryEntity subCategoryEntity) => productsRepository.getBrands(subCategoryEntity);
}
