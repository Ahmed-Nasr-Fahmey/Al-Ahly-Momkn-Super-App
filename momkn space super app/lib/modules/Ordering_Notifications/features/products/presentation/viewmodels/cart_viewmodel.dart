import 'dart:developer';

import 'package:super_app/modules/Ordering_Notifications/features/products/domain/entities/sku_entity.dart';

class CartViewModel{
  static List<CartItem> cartItems=[];
  static addItemToCart(SKUEntity skuEntity){
    bool found= false;
    for(CartItem item in cartItems){
      if(item.skuEntity.skuID == skuEntity.skuID){
        found=true;
      }
    }
    if(!found){
      cartItems.add(CartItem(skuEntity, 1));
    }
  }

  static clearCart(){
    cartItems = [];
  }

  static increment(SKUEntity skuEntity){
    for(CartItem item in cartItems) {
      if (item.skuEntity.skuID == skuEntity.skuID) {
        item.itemCount++;
      }
    }
  }
static decrement(SKUEntity skuEntity){
  for(CartItem item in cartItems) {
    if (item.skuEntity.skuID == skuEntity.skuID) {
      if(item.itemCount>0){
        item.itemCount--;

      }
    }
  }
}
static double getTotalPrice(){
    double price = 0;
    for(CartItem item in cartItems){
      price += (item.itemCount*item.skuEntity.skuPrice);
    }
    return price;
}
}

class CartItem{
  SKUEntity skuEntity ;
  int itemCount ;
  CartItem(this.skuEntity,this.itemCount);
  void increment(){
    itemCount++;
    log("incremented");
  }
  void decrement(){
    if(itemCount>0){
      itemCount--;
      log("decremented");
    }
  }
}