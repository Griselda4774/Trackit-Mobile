import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trackit_mobile__frontend/model/orderDTO.dart';
import 'package:http/http.dart' as http;
import 'package:trackit_mobile__frontend/repositories/orderRepository.dart';
part 'lazada_event.dart';
part 'lazada_state.dart';

class LazadaBloc extends Bloc<LazadaEvent, LazadaState> {
  final OrderRepository orderRepository;

  LazadaBloc({required this.orderRepository}) : super(LazadaInitial()) {
    on<LazadaFetchEvent>((event, emit) async {
      final List<orderDTO> orders;
      emit(LazadaLoading());
      try {
        final response = await orderRepository.getOrderLazada();
        print(response);
        emit(LazadaSuccess(orders: response));
      } catch (e) {
        emit(LazadaFailure(message: e.toString()));
      }
    });
  }
}