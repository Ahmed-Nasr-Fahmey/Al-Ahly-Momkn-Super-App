part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

class GetCatalogsCategoriesSubCategoriesLoadingState extends ProductsState {}

class GetCatalogsCategoriesSubCategoriesErrorState extends ProductsState {
  final String message;

  const GetCatalogsCategoriesSubCategoriesErrorState({required this.message});
}

class GetCatalogsCategoriesSubCategoriesSuccessState extends ProductsState {
  final List<CatalogEntity> catalogs;

  const GetCatalogsCategoriesSubCategoriesSuccessState({required this.catalogs});
}


class GetBrandsWithSKUsLoadingState extends ProductsState {}

class GetBrandsWithSKUsErrorState extends ProductsState {
  final String message;

  const GetBrandsWithSKUsErrorState({required this.message});
}

class GetBrandsWithSKUsSuccessState extends ProductsState {
  final List<BrandEntity> brands;

  const GetBrandsWithSKUsSuccessState({required this.brands});
}

class GetSKUsLoadingState extends ProductsState {}

class GetSKUsErrorState extends ProductsState {
  final String message;

  const GetSKUsErrorState({required this.message});
}

class GetSKUsSuccessState extends ProductsState {
  final List<SKUEntity> skus;

  const GetSKUsSuccessState({required this.skus});
}