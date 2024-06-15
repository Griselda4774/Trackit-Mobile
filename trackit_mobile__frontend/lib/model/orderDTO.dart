import 'dart:convert';

import 'package:trackit_mobile__frontend/model/orderDetailDTO.dart';
import 'package:trackit_mobile__frontend/model/shippingMethodDTO.dart';
import 'package:trackit_mobile__frontend/model/statusDetailDTO.dart';
import 'package:trackit_mobile__frontend/model/userAddressDTO.dart';


class orderDTO {
  String status;
  List<statusDetailDTO>? statusDetailList;
  DateTime createdDate;
  List<orderDetailDTO> orderDetailList;
  num? coin; // Changed from int? to num?
  userAddressDTO? userAddress;
  shippingMethodDTO? shippingMethod;
  String paymentMethod;
  num? totalCost; // Changed from int? to num?
  num? shipCost; // Changed from int? to num?
  num? shipDiscount; // Changed from int? to num?
  num? shopDiscount; // Changed from int? to num?
  num? voucherDiscount; // Changed from int? to num?
  num? finalCost; // Changed from int? to num?
  DateTime? cancelDate;
  String? requestBy;
  String? reason;

  orderDTO({
    required this.status,
    this.statusDetailList,
    required this.createdDate,
    required this.orderDetailList,
    this.coin,
    this.userAddress,
    this.shippingMethod,
    required this.paymentMethod,
    this.totalCost,
    this.shipCost,
    this.shipDiscount,
    this.shopDiscount,
    this.voucherDiscount,
    this.finalCost,
    this.cancelDate,
    this.requestBy,
    this.reason,
  });

  factory orderDTO.fromJson(Map<String, dynamic> json) => orderDTO(
        status: json["status"],
        statusDetailList: json["statusDetailList"] == null
            ? []
            : List<statusDetailDTO>.from(json["statusDetailList"]!
                .map((x) => statusDetailDTO.fromJson(x))),
        createdDate: DateTime.parse(json["createdDate"]),
        orderDetailList: List<orderDetailDTO>.from(
            json["orderDetailList"].map((x) => orderDetailDTO.fromJson(x))),
        coin: json["coin"],
        userAddress: json["userAddress"] == null
            ? null
            : userAddressDTO.fromJson(json["userAddress"]),
        shippingMethod: json["shippingMethod"] == null
            ? null
            : shippingMethodDTO.fromJson(json["shippingMethod"]),
        paymentMethod: json["paymentMethod"],
        totalCost: json["totalCost"],
        shipCost: json["shipCost"],
        shipDiscount: json["shipDiscount"],
        shopDiscount: json["shopDiscount"],
        voucherDiscount: json["voucherDiscount"],
        finalCost: json["finalCost"],
        cancelDate: json["cancelDate"] == null
            ? null
            : DateTime.parse(json["cancelDate"]),
        requestBy: json["requestBy"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusDetailList": statusDetailList == null
            ? []
            : List<dynamic>.from(statusDetailList!.map((x) => x.toJson())),
        "createdDate": createdDate.toIso8601String(),
        "orderDetailList":
            List<dynamic>.from(orderDetailList.map((x) => x.toJson())),
        "coin": coin,
        "userAddress": userAddress?.toJson(),
        "shippingMethod": shippingMethod?.toJson(),
        "paymentMethod": paymentMethod,
        "totalCost": totalCost,
        "shipCost": shipCost,
        "shipDiscount": shipDiscount,
        "shopDiscount": shopDiscount,
        "voucherDiscount": voucherDiscount,
        "finalCost": finalCost,
        "cancelDate": cancelDate?.toIso8601String(),
        "requestBy": requestBy,
        "reason": reason,
      };
}
