
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_entity.dart';

class OrderWithInvoiceEntity {
  final OrderEntity order;
  final InvoiceEntity invoice;

  OrderWithInvoiceEntity({required this.order, required this.invoice});
}
