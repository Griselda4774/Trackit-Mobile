import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackit_mobile__frontend/UI/Screens/DetailStatusPage.dart';
import 'package:trackit_mobile__frontend/model/orderDTO.dart';
import 'package:intl/intl.dart';
import 'package:trackit_mobile__frontend/UI/Screens/DetailOrderPage.dart';

class ProductItem extends StatelessWidget {
  late orderDTO order;
  ProductItem({super.key, required this.order});

  //lấy tổng số lượng sản phẩm
  int? getTotalQuantity() {
    int total = 0;
    for (var orderdetail in order.orderDetailList) {
      for (var productdetail in orderdetail.productList) {
        total += productdetail.quantity!;
      }
    }
    return total;
  }

  //format tiền tệ
  final formatter = NumberFormat('#,###', 'vi_VN');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0), // Bo góc cho item
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        height: order.orderDetailList.length > 1 ? 250 : 210,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  order.orderDetailList.first.productList.first.providedBy,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(
                      order.orderDetailList.first.productList.first.imageUrl),
                  width: 60,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.orderDetailList.first.productList.first.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            Text(
                                "${order.orderDetailList.first.productList.first.productOption}"),
                            Spacer(),
                            Text(
                              "${order.orderDetailList.first.productList.first.quantity}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                                "${formatter.format(order.orderDetailList.first.totalPrice)}")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            if (order.orderDetailList.length > 1) ...[
              GestureDetector(
                onTap: () => _DetailOrderEvent(context),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      "Xem thêm sản phẩm",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),
            ],
            Container(
              child: Row(
                children: [
                  Text("${getTotalQuantity()} sản phẩm"),
                  Spacer(),
                  Text("Thành Tiền: "),
                  Text(
                    "₫${formatter.format(order.totalCost)}",
                    style: TextStyle(color: Color(0xffEE4E2E)),
                  )
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: () => _StatusDetailOrderEvent(context),
              child: Container(
                color: Colors
                    .transparent, // Make sure the container has a background color, even if it's transparent
                child: Row(
                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      color: Color(0xff6CD9C7),
                      size: 18,
                    ),
                    Text(
                      " Giao hàng thành công",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6CD9C7),
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _DetailOrderEvent(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailOrderPage(order: order)));
  }

  void _StatusDetailOrderEvent(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailStatusPage(order: order)));
  }
}
