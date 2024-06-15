import 'dart:convert';

shippingMethodDTO shippingMethodDTOFromJson(String str) => shippingMethodDTO.fromJson(json.decode(str));

String shippingMethodDTOToJson(shippingMethodDTO data) => json.encode(data.toJson());

class shippingMethodDTO {
    String shippedBy;
    double? price;
    double? discount;

    shippingMethodDTO({
        required this.shippedBy,
        required this.price,
        required this.discount,
    });

    factory shippingMethodDTO.fromJson(Map<String, dynamic> json) => shippingMethodDTO(
        shippedBy: json["shippedBy"],
        price: json["price"] != null ? (json["price"] as num).toDouble() : null,
        discount: json["discount"] != null ? (json["discount"] as num).toDouble() : null,
    );

    Map<String, dynamic> toJson() => {
        "shippedBy": shippedBy,
        "price": price,
        "discount": discount,
    };
}