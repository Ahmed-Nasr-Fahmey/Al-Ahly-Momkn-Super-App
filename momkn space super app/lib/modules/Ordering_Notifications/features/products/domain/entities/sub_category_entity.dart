import 'package:equatable/equatable.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/brand_entity.dart';

class SubCategoryEntity extends Equatable {
    final String categoryId;
  final String subCategoryName;
  final String subCategoryId;
  final List<BrandEntity> brands;

  const SubCategoryEntity({required this.categoryId, required this.subCategoryName, required this.subCategoryId, required this.brands});


  @override
  List<Object?> get props => [];

}


