import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import gói intl
import 'package:trackit_mobile__frontend/model/statusDetailDTO.dart';

class StatusItem extends StatelessWidget {
  final statusDetailDTO statusDetail;
  const StatusItem({super.key, required this.statusDetail});

  @override
  Widget build(BuildContext context) {
    // Kiểm tra nếu date không null và chuyển đổi nó
    String formattedDateTime = '';
    if (statusDetail.date != null) {
      String dateString = statusDetail.date!.toIso8601String();
      // Loại bỏ ".000Z" từ chuỗi
      dateString = dateString.replaceAll(RegExp(r'.000Z$'), '');
      DateTime dateTime = DateTime.parse(dateString);
      formattedDateTime = DateFormat('HH:mm:ss dd/MM/yyyy')
          .format(dateTime); // Định dạng ngày và giờ
    }

    return Padding(
      padding: const EdgeInsets.all(8.0), // Sử dụng padding nhỏ hơn
      child: IntrinsicHeight(
        child: Container(
          padding:
              const EdgeInsets.all(8.0), // Thêm padding bên trong Container
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Canh trái cho văn bản
            children: [
              if (statusDetail.title != null && statusDetail.title!.isNotEmpty)
                Text(
                  "${statusDetail.title}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              if (formattedDateTime.isNotEmpty)
                Text(
                  formattedDateTime,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              if (statusDetail.content != null &&
                  statusDetail.content!.isNotEmpty)
                Text(
                  "${statusDetail.content}",
                ),
            ],
          ),
        ),
      ),
    );
  }
}
