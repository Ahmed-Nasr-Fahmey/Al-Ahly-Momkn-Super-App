import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/brand_entity.dart';

import '../../../../core/constants/api_conatsants.dart';

class BrandModel extends BrandEntity {
  BrandModel(super.subCategoryId, super.brandName, super.paymentOptions, super.brandStatus, super.SKUs, super.brandId);
  factory BrandModel.fromJson(Map<String,dynamic> jsonData){
    return BrandModel(jsonData[subCategoryIdBrandAPIKey], jsonData[brandNameAPIKey], jsonData[paymentOptionsBrandAPIKey], jsonData[brandStatusAPIKey], jsonData[SKUsAPIKey], jsonData[brandIdAPIKey]);
  }
  Map<String,dynamic>toJson(){
    return {
      subCategoryIdBrandAPIKey:subCategoryId,
      brandNameAPIKey:brandName,
      paymentOptionsBrandAPIKey:paymentOptions,
      brandStatusAPIKey:brandStatus,
      SKUsAPIKey:SKUs,
      brandIdAPIKey:brandId,
    };
  }
}




