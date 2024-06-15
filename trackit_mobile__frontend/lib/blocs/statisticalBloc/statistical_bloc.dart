import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trackit_mobile__frontend/model/orderDTO.dart';
import 'package:trackit_mobile__frontend/repositories/orderRepository.dart';

part 'statistical_event.dart';
part 'statistical_state.dart';

class StatisticalBloc extends Bloc<StatisticalEvent, StatisticalState> {
  final OrderRepository orderRepository;
  StatisticalBloc({required this.orderRepository})
      : super(StatisticalInitial()) {
    on<StatisticalfetchOrderData>((event, emit) async {
      emit(StatisticalLoading());
      try {
        final orderShopee = await orderRepository.orderService.getOrderShopee();
        final orderLazada = await orderRepository.orderService.getOrderLazada();
        emit(StatisticalSuccess(
            orderShopee: orderShopee, orderLazada: orderLazada));
      } catch (e) {
        emit(StatisticalFailure(message: e.toString()));
      }
    });
  }
}
