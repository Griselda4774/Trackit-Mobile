import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/myTimeLineTile.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/statusItem.dart';
import 'package:trackit_mobile__frontend/model/orderDTO.dart';

class DetailStatusPage extends StatefulWidget {
  final orderDTO order;
  const DetailStatusPage({super.key, required this.order});

  @override
  State<DetailStatusPage> createState() => _DetailStatusPageState();
}

class _DetailStatusPageState extends State<DetailStatusPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text("Chi tiết trạng thái đơn hàng"),
          centerTitle: true,
          backgroundColor: Colors.grey.shade200,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: ListView.builder(
              itemCount: widget.order.statusDetailList?.length,
              itemBuilder: (context, index) {
                return MyTimeLineTile(
                    isFirst: index == 0 ? true : false,
                    isLast: index + 1 == widget.order.statusDetailList!.length,
                    isPast: index + 1 == widget.order.statusDetailList!.length
                        ? false
                        : true,
                    areDelivering: index == 1 ? true : false,
                    statusDetail: widget.order.statusDetailList![index]);
              }),
        ),
      ),
    );
  }
}
