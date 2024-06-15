part of 'shopee_bloc.dart';

@immutable
sealed class ShopeeState {}

final class ShopeeInitial extends ShopeeState {}

final class ShopeeLoading extends ShopeeState {}

final class ShopeeSuccess extends ShopeeState {
  final List<orderDTO> orders;

  ShopeeSuccess({required this.orders});
}

final class ShopeeFailure extends ShopeeState {
  final String message;

  ShopeeFailure({required this.message});
}
