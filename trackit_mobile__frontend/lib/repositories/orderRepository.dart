import 'package:trackit_mobile__frontend/service/orderService.dart';

class OrderRepository {
  final OrderService orderService = OrderService();

  Future<dynamic> getOrderShopee() async {
    try {
      return await orderService.getOrderShopee();
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  Future<dynamic> getOrderLazada() async {
    try {
      return await orderService.getOrderLazada();
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
