import 'package:equatable/equatable.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/category_entity.dart';

class CatalogEntity extends Equatable {
  final String orgId;
  final String catalogName;
  final String catalogId;
  final bool catalogStatus;
  final List<CategoryEntity> categories;

  const CatalogEntity({required this.orgId, required this.catalogName, required this.catalogId, required this.catalogStatus, required this.categories});
  
  @override
  List<Object?> get props => [];



}


