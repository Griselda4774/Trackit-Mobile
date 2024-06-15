import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/StatusItem.dart';
import 'package:trackit_mobile__frontend/model/statusDetailDTO.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final bool areDelivering;

  final statusDetailDTO statusDetail;
  const MyTimeLineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.statusDetail,
      required this.areDelivering});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: Color(0xffFF7256)),
        indicatorStyle: IndicatorStyle(
            width: 40,
            color: Color(0xffFF7256),
            iconStyle: IconStyle(
              iconData: isLast || isFirst
                  ? Icons.done
                  : (areDelivering
                      ? Icons.local_shipping_outlined
                      : Icons.circle_outlined),
              color: Colors.white,
            )),
        endChild: StatusItem(statusDetail: statusDetail),
      ),
    );
  }
}
