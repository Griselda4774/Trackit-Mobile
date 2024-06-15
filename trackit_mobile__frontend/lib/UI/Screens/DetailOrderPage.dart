import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/ProductDetailItem.dart';
import 'package:trackit_mobile__frontend/model/orderDTO.dart';
import 'package:trackit_mobile__frontend/model/orderDetailDTO.dart';
import 'package:trackit_mobile__frontend/model/productDetailDTO.dart';

class DetailOrderPage extends StatelessWidget {
  final orderDTO order;

  const DetailOrderPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'vi_VN');

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Text("Thông tin đơn hàng"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            if (order.shippingMethod != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Bo góc
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,
                            color: Color(0xff6CD9C7),
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Thông tin vận chuyển",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "Vận chuyển bởi: ${order.shippingMethod!.shippedBy}"),
                                  Text(
                                      "Giảm giá: ₫${formatter.format(order.shippingMethod!.discount)}")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: order.orderDetailList.length,
                      itemBuilder: (context, index) {
                        final orderDetail = order.orderDetailList[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: orderDetail.productList.map((product) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                              child: ProductDetailItem(productdetail: product),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
