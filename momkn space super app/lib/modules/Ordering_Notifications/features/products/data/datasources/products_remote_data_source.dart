import 'dart:developer';

import 'package:super_app/modules/Ordering_Notifications/core/constants/api_conatsants.dart';
import 'package:super_app/modules/Ordering_Notifications/core/network/api_caller.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/cache_helper.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/models/catalog_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/models/category_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/models/sku_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/models/sub_category_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/brand_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/catalog_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sku_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sub_category_entity.dart';

import '../../../../../../token_getter.dart';
import '../models/brand_model.dart';

 abstract class ProductsRemoteDataSource {
  Future<List<CatalogEntity>> getCatalosCategoriesSubCategories();
  Future<List<BrandModel>> getBrands(SubCategoryEntity subCategoryEntity);
  Future<List<SKUEntity>> getSKUs(BrandEntity brandEntity);
}

class ProductsRemoteDataSourceImplWithDio extends ProductsRemoteDataSource {

  @override
  Future<List<CatalogEntity>> getCatalosCategoriesSubCategories() async {
    try {
      final jsonRes = await ApiCaller.getHTTP(
          '/catalogTree/get/663cf8d5831af4f499b4bdb6',
          null,
          TokenGetter.myToken);
      List<CatalogModel> catalogs = [];
      for (var catalogJson in jsonRes.data) {
        List<CategoryModel> categories = [];
        if (catalogJson[categoriesAPIKey].length != 0) {
          categories = await getCategories(catalogJson[catalogIdAPIKey]);
        }
        catalogs.add(CatalogModel(
            orgId: catalogJson[orgIdAPIKey],
            catalogName: catalogJson[catalogNameAPIKey],
            catalogId: catalogJson[catalogIdAPIKey],
            catalogStatus: catalogJson[catalogStatusAPIKey],
            categories: categories));
      }
      await CacheHelper.cacheCatalogs(catalogs);
      return catalogs;
    } catch (e) {
      log("${e.toString()} error in get catalogs in datasource");
      rethrow;
    }
  }

  @override
  Future<List<SKUEntity>> getSKUs(BrandEntity brandEntity) async {
    try {
      final jsonRes = await ApiCaller.getHTTP(
          '/sku/get/${brandEntity.brandId}',
          null,
          TokenGetter.myToken);
      List<SKUModel> SKUs = [];
      for (var skuJson in jsonRes.data) {
        SKUs.add(SKUModel.fromJson(skuJson));
      }
      return SKUs;
    } catch (e) {
      log("${e.toString()} error in get SKUs in datasource");
      rethrow;
    }
  }

  Future<List<SKUEntity>> getSKUsByBrandId(String brandId) async {
    try {
      final jsonRes = await ApiCaller.getHTTP(
          '/sku/get/$brandId',
          null,
          TokenGetter.myToken);
      List<SKUModel> SKUs = [];
      for (var skuJson in jsonRes.data) {
        SKUs.add(SKUModel.fromJson(skuJson));
      }
      return SKUs;
    } catch (e) {
      log("${e.toString()} error in get SKUs in datasource");
      rethrow;
    }
  }

  @override
  Future<List<BrandModel>> getBrands(
      SubCategoryEntity subCategoryEntity) async {
    try {
      if(subCategoryEntity.brands.length==0){
        return [];
      }
      final jsonRes = await ApiCaller.getHTTP(
          '/brand/get/${subCategoryEntity.subCategoryId}',
          null,
          TokenGetter.myToken);
      List<BrandModel> brands = [];
      for (var brandJson in jsonRes.data) {
         final List<SKUEntity> skus = await getSKUsByBrandId(brandJson[brandIdAPIKey]);
        brands.add(BrandModel(brandJson[subCategoryIdBrandAPIKey], brandJson[brandNameAPIKey], brandJson[paymentOptionsBrandAPIKey], brandJson[brandStatusAPIKey],skus, brandJson[brandIdAPIKey]),);
      }
      return brands;
    } catch (e) {
      log("${e.toString()} error in get Brands in datasource");
      rethrow;
    }
  }
}
Future<List<BrandModel>> getBrandById(
    String subCategoryID) async {
  try {

    final jsonRes = await ApiCaller.getHTTP(
        '/brand/get/${subCategoryID}',
        null,
        TokenGetter.myToken);
    List<BrandModel> brands = [];
    for (var brandJson in jsonRes.data) {
      brands.add(BrandModel.fromJson(brandJson));
    }
    return brands;
  } catch (e) {
    log("${e.toString()} error in get Brands in datasource");
    rethrow;
  }
}


Future<List<CategoryModel>> getCategories(String catalogId) async {
  try {
    final jsonRes = await ApiCaller.getHTTP('/category/get/$catalogId', null,
        TokenGetter.myToken);
    List<CategoryModel> categories = [];
    for (var categoryJson in jsonRes.data) {
      List<SubCategoryModel> subCategories = [];
      if (categoryJson[subCategoriesAPIKey].length != 0) {
        subCategories = await getSubCategories(categoryJson[categoryIdAPIKey]);
      }
      categories.add(CategoryModel(
          catalogId: categoryJson[catalogIdAPIKey],
          categoryName: categoryJson[categoryNameAPIKey],
          categoryId: categoryJson[categoryIdAPIKey],
          subCategories: subCategories));
    }
    return categories;
  } catch (e) {
    log("${e.toString()} error in get Categories in datasource");
    rethrow;
  }
}

Future<List<SubCategoryModel>> getSubCategories(String categoryId) async {
  try {
    final jsonRes = await ApiCaller.getHTTP(
        '/subCategory/get/$categoryId',
        null,
        TokenGetter.myToken);
    List<SubCategoryModel> subCategories = [];
    for (var subCategoryJson in jsonRes.data) {
      List<BrandModel> brands = [];
      log(subCategoryJson.toString());

      if (subCategoryJson["brands"].length != 0) {
        log("henaaa???");
        brands = await getBrandById(subCategoryJson["sub_Category_ID"]);
        log("wala henaaa???");
      }
      subCategories.add(SubCategoryModel(
          categoryId: subCategoryJson[categoryIdAPIKey],
          subCategoryName: subCategoryJson[subCategoryNameAPIKey],
          subCategoryId: subCategoryJson[subCategoryIdAPIKey],
          brands: brands));
    }
    return subCategories;
  } catch (e) {
    log("${e.toString()} error in get subCategories in datasource");
    rethrow;
  }
}
