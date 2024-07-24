
import 'package:super_app/modules/Ordering_Notifications/core/constants/api_conatsants.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/models/category_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/catalog_entity.dart';

class CatalogModel extends CatalogEntity {
  const CatalogModel(
      {required super.orgId,
      required super.catalogName,
      required super.catalogId,
      required super.catalogStatus,
      required super.categories});

  factory CatalogModel.fromJson(Map<String, dynamic> jsonData) {

    List<CategoryModel> categories = [];
    for(var element in jsonData["categories"]){
      categories.add(CategoryModel.fromJson(element));
    }

    return CatalogModel(
        orgId: jsonData[orgIdAPIKey],
        catalogName: jsonData[catalogNameAPIKey],
        catalogId: jsonData[catalogIdAPIKey],
        catalogStatus: jsonData[catalogStatusAPIKey],
        categories: categories);
  }
  Map<String, dynamic> toJson() {
    return {
      orgIdAPIKey: orgId,
      catalogNameAPIKey: catalogName,
      catalogIdAPIKey: catalogId,
      catalogStatusAPIKey: catalogStatus,
      categoriesAPIKey: categories,
    };
  }
}
