part of 'statistical_bloc.dart';

@immutable
sealed class StatisticalState {}

final class StatisticalInitial extends StatisticalState {}

final class StatisticalLoading extends StatisticalState {}

final class StatisticalSuccess extends StatisticalState {
  final orderDTO orderShopee;
  final orderDTO orderLazada;

  StatisticalSuccess({required this.orderShopee, required this.orderLazada});
}

final class StatisticalFailure extends StatisticalState {
  final String message;

  StatisticalFailure({required this.message});
}

