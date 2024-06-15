import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trackit_mobile__frontend/model/orderDTO.dart';
import '../utils/constant.dart';

class OrderService {
  Future<dynamic> getOrderShopee() async {
    try {
      List<orderDTO> orders = [];
      final response = await http.get(
          Uri.parse("https://anhtu301003.github.io/host_api/trackit.json"));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];

        orders = data.map<orderDTO>((json) => orderDTO.fromJson(json)).toList();
        print(orders);
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> getOrderLazada() async {
    try {
      List<orderDTO> orders = [];
      final response = await http.get(
          Uri.parse("https://anhtu301003.github.io/host_api/trackit.json"));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        var data = jsonData['data'];

        orders = data.map<orderDTO>((json) => orderDTO.fromJson(json)).toList();
        print(orders);
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
