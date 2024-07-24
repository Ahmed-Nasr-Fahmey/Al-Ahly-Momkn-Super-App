part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetCatalogsCategoriesSubCategoriesEvent extends ProductsEvent {
  const GetCatalogsCategoriesSubCategoriesEvent();
}


class GetBrandsWithSKUsEvent extends ProductsEvent {
  final SubCategoryEntity subCategoryEntity;
  const GetBrandsWithSKUsEvent(this.subCategoryEntity);
}

class GetSKUsEvent extends ProductsEvent {
  final BrandEntity brand;
  const GetSKUsEvent(this.brand);
}