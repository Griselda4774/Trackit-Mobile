import 'dart:convert';

productDetailDTO productDetailDTOFromJson(String str) =>
    productDetailDTO.fromJson(json.decode(str));

String productDetailDTOToJson(productDetailDTO data) =>
    json.encode(data.toJson());

class productDetailDTO {
  String name;
  String providedBy;
  String imageUrl;
  num price;
  String? productOption;
  int? quantity;

  productDetailDTO({
    required this.name,
    required this.providedBy,
    required this.imageUrl,
    required this.price,
    required this.productOption,
    required this.quantity,
  });

  factory productDetailDTO.fromJson(Map<String, dynamic> json) =>
      productDetailDTO(
        name: json["name"],
        providedBy: json["providedBy"],
        imageUrl: json["imageUrl"],
        price: json["price"],
        productOption: json["productOption"],
        quantity:
            json["quantity"] != null ? (json["quantity"] as num).toInt() : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "providedBy": providedBy,
        "imageUrl": imageUrl,
        "price": price,
        "productOption": productOption,
        "quantity": quantity,
      };
}
