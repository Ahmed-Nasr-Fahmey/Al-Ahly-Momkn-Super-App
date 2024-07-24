import 'package:equatable/equatable.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sub_category_entity.dart';

class CategoryEntity extends Equatable {
  final String catalogId;
  final String categoryName;
  final String categoryId;
  final List<SubCategoryEntity> subCategories;

  CategoryEntity({required this.catalogId, required this.categoryName, required this.categoryId, required this.subCategories});


  @override
  List<Object?> get props => [];

}

