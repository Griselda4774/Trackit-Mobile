import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/ProductItem.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/ProductItemCanceled.dart';
import 'package:trackit_mobile__frontend/blocs/lazadaBloc/lazada_bloc.dart';

class LazadaScreen extends StatefulWidget {
  const LazadaScreen({super.key});
  @override
  State<LazadaScreen> createState() => _LazadaScreenState();
}

class _LazadaScreenState extends State<LazadaScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LazadaBloc, LazadaState>(
      listener: (context, state) {
        if (state is LazadaFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is LazadaLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LazadaSuccess) {
          final orders = state.orders;
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Lazada"),
                backgroundColor: Colors.grey.shade100,
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "Đã giao"),
                    Tab(text: "Đã hủy"),
                    Tab(text: "Vận chuyển"),
                    Tab(text: "Chờ giao hàng"),
                  ],
                  labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
              backgroundColor: Colors.grey.shade100,
              body: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: orders
                        .where((order) => order.status == "Success")
                        .length,
                    itemBuilder: (context, index) {
                      final order = orders
                          .where((order) => order.status == "Success")
                          .toList()[index];
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: ProductItem(order: order));
                    },
                  ),
                  ListView.builder(
                    itemCount: orders
                        .where((order) => order.status == "Cancelled")
                        .length,
                    itemBuilder: (context, index) {
                      final order = orders
                          .where((order) => order.status == "Cancelled")
                          .toList()[index];
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: ProductItemCanceled(order: order));
                    },
                  ),
                  const Center(child: Text('Vận chuyển')),
                  const Center(child: Text('Chờ giao hàng')),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('Error'));
        }
      },
    );
  }
}
