part of 'ordering_bloc.dart';

sealed class OrderingEvent extends Equatable {
  const OrderingEvent();

  @override
  List<Object> get props => [];
}

class GetOrdersWithInvoicesEvent extends OrderingEvent {
  const GetOrdersWithInvoicesEvent();
}

class CreateOrderEvent extends OrderingEvent {
  const CreateOrderEvent();
}
