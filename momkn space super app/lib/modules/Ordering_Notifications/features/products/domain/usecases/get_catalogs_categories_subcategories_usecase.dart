import 'package:dartz/dartz.dart';
import 'package:super_app/modules/Ordering_Notifications/core/errors/failures.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/catalog_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/repositories/products_repository.dart';

class GetCatalogsCategoriesSubCategriesUsecase {
  final ProductsRepository productsRepository;

  GetCatalogsCategoriesSubCategriesUsecase({required this.productsRepository});
  Future<Either<Failure, List<CatalogEntity>>> call() => productsRepository.getCatalosCategoriesSubCategories();
}
