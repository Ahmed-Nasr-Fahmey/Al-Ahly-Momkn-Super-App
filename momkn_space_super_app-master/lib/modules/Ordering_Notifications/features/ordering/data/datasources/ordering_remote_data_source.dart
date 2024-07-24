import 'dart:developer';

import 'package:super_app/modules/Ordering_Notifications/core/network/api_caller.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/data/models/invoice_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/data/models/order_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/data/models/order_with_invoice_model.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_with_invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/products/presentation/viewmodels/cart_viewmodel.dart';
import 'package:super_app/token_getter.dart';

abstract class OrderingRemoteDataSource {
  Future<List<OrderWithInvoiceEntity>> getOrdersWithInvoices();
  Future<OrderEntity> createOrder();
  Future<InvoiceEntity> createInvoice();
}

class OrderingRemoteDataSourceImplWithDio extends OrderingRemoteDataSource {
  @override
  Future<OrderEntity> createOrder() async {
    final cartItems = CartViewModel.cartItems;
    final List <dynamic>SKUS =[];
    for(CartItem item in cartItems){
      SKUS.add({"SKU":item.skuEntity.skuID,"count":item.itemCount});
    }
    try {
      final jsonRes = await ApiCaller.postHTTP(
          '/order/',
          {
            "order": {
              "organization_ID": "663cf8d5831af4f499b4bdb6",
              "Username": "Ahmed Serag from the app",
              "Order_Amount": CartViewModel.getTotalPrice(),
              "Paid": "Total",
              "Paid_Amount": CartViewModel.getTotalPrice(),
              "user_Mobile_Number": "3"
            },
            "SKUs": SKUS
          },
          TokenGetter.myToken);
      log(jsonRes.data.toString());
      final OrderModel order = OrderModel.fromJson(jsonRes.data);
      await createInvoicee(order);
    CartViewModel.clearCart();
      return order;
    } catch (e) {
      log("${e.toString()} error in create orderr in remote datasource");
      rethrow;
    }
  }

  Future<InvoiceEntity> createInvoicee(OrderEntity order) async {
    try {
      final jsonRes = await ApiCaller.postHTTP(
          '/invoice/create',
          {
            "payment_Option": "card",
            "organization_Id": "663cf8d5831af4f499b4bdb6",
            "order_Id": order.orderId,
            "username": "Ahmed Serag",
            "invoice_Amount": double.parse(order.orderAmount)
          },
          TokenGetter.myToken);
      final invoice = InvoiceModel.fromJson(jsonRes.data);
      return invoice;
    } catch (e) {
      log("${e.toString()} error in create invoice in remote datasource");
      rethrow;
    }
  }

  @override
  Future<List<OrderWithInvoiceEntity>> getOrdersWithInvoices() async {
      try {
      final jsonRes = await ApiCaller.getHTTP('/order/', {"user_Mobile_Number": "3"},
          TokenGetter.myToken);
      List<OrderWithInvoiceEntity> ordersWithInvoices = [];
      for (var element in jsonRes.data) {
        log(element.toString());
        if (element["invoice"] != null) {
          final order = OrderModel.fromJson(element["order"]);
          final invoice = InvoiceModel.fromJson(element["invoice"]);
          final orderWithInvoice = OrderWithInvoiceModel(order: order, invoice: invoice);
          ordersWithInvoices.add(orderWithInvoice);
        }
      }
      return ordersWithInvoices;
    } catch (e) {
      log("${e.toString()} error in getOrdersWithInvoices in remote datasource");
      rethrow;
    }
  }

  @override
  Future<InvoiceEntity> createInvoice() {
    throw UnimplementedError();
  }
}
