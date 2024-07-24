import '../../../../core/constants/api_conatsants.dart';
import '../../domain/entities/sku_entity.dart';

class SKUModel extends SKUEntity{
  SKUModel(super.brandId, super.skuName, super.skuDescription, super.skuCost, super.skuPrice, super.skuExtendedPriceOne, super.skuExtendedPriceTwo, super.activeSKU, super.skuID);
  factory SKUModel.fromJson(Map<String,dynamic>jsonData){
    return SKUModel(jsonData[brandIdSKUAPIKey], jsonData[skuNameSKUAPIKey], jsonData[skuDescriptionSKUAPIKey], jsonData[skuCostSKUAPIKey], jsonData[skuPriceSKUAPIKey], jsonData[skuExtendedPriceOneSKUAPIKey], jsonData[skuExtendedPriceTwoSKUAPIKey], jsonData[activeSKUSKUAPIKey], jsonData[skuIDSKUAPIKey]);
  }

  Map<String,dynamic> toJson(){
    return {
      brandIdSKUAPIKey:brandId,
      skuNameSKUAPIKey:skuName,
      skuDescriptionSKUAPIKey:skuDescription,
      skuCostSKUAPIKey:skuCost,
      skuPriceSKUAPIKey:skuPrice,
      skuExtendedPriceOneSKUAPIKey:skuExtendedPriceOne,
      skuExtendedPriceTwoSKUAPIKey:skuExtendedPriceTwo,
      activeSKUSKUAPIKey:activeSKU,
      skuIDSKUAPIKey:skuID
    };
  }
}

