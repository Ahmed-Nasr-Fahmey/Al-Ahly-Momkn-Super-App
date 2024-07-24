import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/data/datasources/ordering_remote_data_source.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/data/repositories/oredering_repository_impl.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/entities/order_with_invoice_entity.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/usecases/create_order_usecase.dart';
import 'package:super_app/modules/Ordering_Notifications/features/ordering/domain/usecases/get_orders_with_invoices_usecase.dart';

part 'ordering_event.dart';
part 'ordering_state.dart';

class OrderingBloc extends Bloc<OrderingEvent, OrderingState> {
  OrderingBloc() : super(OrderingInitial()) {
    on<OrderingEvent>((event, emit) {});

    on<GetOrdersWithInvoicesEvent>(
      (event, emit) async {
        emit(GetOrdersWithInvoicesLoadingState());
        GetOrdersWithInvoicesUsecase getOrdersWithInvoicesUsecase = GetOrdersWithInvoicesUsecase(
            orderingRepository: OrderingRepositoryImpl(orderingRemoteDataSource: OrderingRemoteDataSourceImplWithDio()));
        final either = await getOrdersWithInvoicesUsecase.call();
        either.fold((l) {
          emit(GetOrdersWithInvoicesErrorState(message: l.message));
        }, (r) {
          log("fel blocccc");
          emit(GetOrdersWithInvoicesSuccessState(ordersWithInvoices: r));
        });
      },
    );

    on<CreateOrderEvent>(
      (event, emit) async {
        emit(CreateOrderLoadingState());
        CreateOrderUsecase getOrdersWithInvoicesUsecase =
            CreateOrderUsecase(orderingRepository: OrderingRepositoryImpl(orderingRemoteDataSource: OrderingRemoteDataSourceImplWithDio()));
        final either = await getOrdersWithInvoicesUsecase.call();
        either.fold((l) {
          emit(CreateOrderErrorState(message: l.message));
        }, (r) {
          log("fel blocccc");
          emit(CreateOrderSuccessState());
        });
      },
    );
  }
}
