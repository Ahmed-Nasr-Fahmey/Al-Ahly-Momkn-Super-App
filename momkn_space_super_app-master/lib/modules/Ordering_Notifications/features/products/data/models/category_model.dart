
import 'package:super_app/modules/Ordering_Notifications/core/constants/api_conatsants.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/data/models/sub_category_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.catalogId, required super.categoryName, required super.categoryId, required super.subCategories});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {

    List<SubCategoryModel> subCategories = [];
    for(var element in jsonData["sub_Categories"]){
      subCategories.add(SubCategoryModel.fromJson(element));
    }
    return CategoryModel(
        catalogId: jsonData[catalogIdAPIKey],
        categoryName: jsonData[categoryNameAPIKey],
        categoryId: jsonData[categoryIdAPIKey],
        subCategories: subCategories);
  }
  Map<String, dynamic> toJson() {
    return {
      catalogIdAPIKey: catalogId,
      categoryNameAPIKey: categoryName,
      categoryIdAPIKey: categoryId,
      subCategoriesAPIKey: subCategories,
    };
  }
}
