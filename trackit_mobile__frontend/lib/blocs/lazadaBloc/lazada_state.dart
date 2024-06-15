part of 'lazada_bloc.dart';

@immutable
sealed class LazadaState {}

final class LazadaInitial extends LazadaState {}

final class LazadaLoading extends LazadaState {}

final class LazadaSuccess extends LazadaState {
  final List<orderDTO> orders;

  LazadaSuccess({required this.orders});
}

final class LazadaFailure extends LazadaState {
  final String message;

  LazadaFailure({required this.message});
}