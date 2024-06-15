import 'dart:convert';

import 'package:trackit_mobile__frontend/model/productDetailDTO.dart';

orderDetailDTO orderDetailDTOFromJson(String str) => orderDetailDTO.fromJson(json.decode(str));

String orderDetailDTOToJson(orderDetailDTO data) => json.encode(data.toJson());

class orderDetailDTO {
    List<productDetailDTO> productList;
    double? discount;
    double? totalPrice;

    orderDetailDTO({
        required this.productList,
        required this.discount,
        required this.totalPrice,
    });

    factory orderDetailDTO.fromJson(Map<String, dynamic> json) => orderDetailDTO(
        productList: List<productDetailDTO>.from(json["productList"].map((x) => productDetailDTO.fromJson(x))),
        discount: json["discount"] != null ? (json["discount"] as num).toDouble() : null,
        totalPrice: json["totalPrice"] != null ? (json["totalPrice"] as num).toDouble() : null,
    );

    Map<String, dynamic> toJson() => {
        "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
        "discount": discount,
        "totalPrice": totalPrice,
    };
}