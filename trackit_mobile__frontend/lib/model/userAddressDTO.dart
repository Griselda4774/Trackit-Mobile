import 'dart:convert';

userAddressDTO userAddressDTOFromJson(String str) =>
    userAddressDTO.fromJson(json.decode(str));

String userAddressDTOToJson(userAddressDTO data) => json.encode(data.toJson());

class userAddressDTO {
  String name;
  String? address;
  String? phone;

  userAddressDTO({
    required this.name,
    required this.address,
    required this.phone,
  });

  factory userAddressDTO.fromJson(Map<String, dynamic> json) => userAddressDTO(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phone": phone,
      };
}