part of 'ordering_bloc.dart';

sealed class OrderingState extends Equatable {
  const OrderingState();

  @override
  List<Object> get props => [];
}

final class OrderingInitial extends OrderingState {}

class GetOrdersWithInvoicesLoadingState extends OrderingState {}

class GetOrdersWithInvoicesErrorState extends OrderingState {
  final String message;

  const GetOrdersWithInvoicesErrorState({required this.message});
}

class GetOrdersWithInvoicesSuccessState extends OrderingState {
  final List<OrderWithInvoiceEntity> ordersWithInvoices;

  const GetOrdersWithInvoicesSuccessState({required this.ordersWithInvoices});
}

class CreateOrderLoadingState extends OrderingState {}

class CreateOrderErrorState extends OrderingState {
  final String message;

  const CreateOrderErrorState({required this.message});
}

class CreateOrderSuccessState extends OrderingState {

}
