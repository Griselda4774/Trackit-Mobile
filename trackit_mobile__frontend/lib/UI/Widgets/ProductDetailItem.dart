import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trackit_mobile__frontend/model/productDetailDTO.dart';

class ProductDetailItem extends StatelessWidget {
  final productDetailDTO productdetail;
  const ProductDetailItem({super.key, required this.productdetail});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Bo góc
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  productdetail.imageUrl,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productdetail.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("Cung cấp bởi: ${productdetail.providedBy}"),
                      if (productdetail.price > 0)
                        Text("Giá: ₫${formatter.format(productdetail.price)}"),
                      Text("Số lượng: ${productdetail.quantity}"),
                      if (productdetail.productOption != null)
                        Text("Tùy chọn: ${productdetail.productOption}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
