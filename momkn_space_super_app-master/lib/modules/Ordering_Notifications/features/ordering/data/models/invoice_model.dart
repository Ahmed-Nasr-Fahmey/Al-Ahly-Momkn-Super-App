
import 'package:super_app/modules/Ordering_Notifications/core/constants/api_conatsants.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/invoice_entity.dart';

class InvoiceModel extends InvoiceEntity {
  const InvoiceModel({required super.paymentOption, required super.orgId, required super.orderId, required super.username, required super.paymentReference, required super.invoiceDate, required super.invoiceAmount});


  factory InvoiceModel.fromJson(Map<String, dynamic> jsonData) {
    return InvoiceModel(paymentOption: jsonData[paymentOptionAPIKey], orgId: jsonData[orgIdInvoiceAPIKey], orderId: jsonData[orderIdInvoiceAPIKey], username: jsonData[usernameInvoiceAPIKey], paymentReference: jsonData[paymentReferenceInvoiceAPIKey], invoiceDate: jsonData[invoiceDateAPIKey], invoiceAmount: jsonData[invoiceAmountAPIKey]);
  }




  // Map<String, dynamic> toJson() {
  //   return {
  //     orgIdAPIKey:,
  //     idAPIKey: id,
  //     titleAPIKey: title,
  //     bodyAPIKey: body,
  //     effectiveDataAPIKey: effectiveDate,
  //     userMobileNumberAPIKey: userMobileNumber,
  //     senderNameAPIKey: senderName,
  //   };
  // }
}


