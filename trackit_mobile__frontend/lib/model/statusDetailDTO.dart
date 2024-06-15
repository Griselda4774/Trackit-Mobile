import 'dart:convert';

statusDetailDTO statusDetailDTOFromJson(String str) =>
    statusDetailDTO.fromJson(json.decode(str));

String statusDetailDTOToJson(statusDetailDTO data) =>
    json.encode(data.toJson());

class statusDetailDTO {
  DateTime? date;
  String? title;
  String? content;

  statusDetailDTO({
    required this.date,
    required this.title,
    required this.content,
  });

  factory statusDetailDTO.fromJson(Map<String, dynamic> json) =>
      statusDetailDTO(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "title": title,
        "content": content,
      };
}
