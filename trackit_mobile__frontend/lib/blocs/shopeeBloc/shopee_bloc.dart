import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:trackit_mobile__frontend/model/orderDTO.dart';
import 'package:trackit_mobile__frontend/repositories/orderRepository.dart';

part 'shopee_event.dart';
part 'shopee_state.dart';

class ShopeeBloc extends Bloc<ShopeeEvent, ShopeeState> {
  final OrderRepository orderRepository;

  ShopeeBloc({required this.orderRepository}) : super(ShopeeInitial()) {
    on<ShopeeFetchEvent>((event, emit) async {
      final List<orderDTO> orders;
      emit(ShopeeLoading());
      try {
        final response = await orderRepository.getOrderShopee();
        print(response);
        emit(ShopeeSuccess(orders: response));
      } catch (e) {
        emit(ShopeeFailure(message: e.toString()));
      }
    });
  }
}
