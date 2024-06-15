import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/ButtonWidget.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/TextFieldWidget.dart';
import 'package:trackit_mobile__frontend/utils/constant.dart';
import '../../utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _ShopeeUsernameController = TextEditingController();
  final _ShopeePasswordController = TextEditingController();
  final _LazadaUsernameController = TextEditingController();
  final _LazadaPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Căn chỉnh theo chiều dọc
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Căn chỉnh theo chiều ngang
                children: [
                  Container(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/shopee-img.svg',
                          height: 100,
                          width: 100,
                        ),
                        TextFieldWidget(
                          hintText: "Tài khoản shopee",
                          obscureText: false,
                          color: Color(0xffFF7256),
                          controller: _ShopeeUsernameController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hintText: "Mật khẩu shopee",
                          obscureText: true,
                          color: Color(0xffFF7256),
                          controller: _ShopeePasswordController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5),
                          child: Container(
                            child: ButtonWidget(
                              text: "Liên kết với Shopee",
                              onTap: () {},
                              color: Color(0xffFF7256),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Khoảng cách giữa hai container
                  Container(
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/lazada-img.svg'),
                        TextFieldWidget(
                          hintText: "Tài khoản lazada",
                          obscureText: false,
                          color: primaryColor,
                          controller: _LazadaUsernameController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hintText: "Mật khẩu lazada",
                          obscureText: true,
                          color: primaryColor,
                          controller: _LazadaPasswordController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: Container(
                            child: ButtonWidget(
                              text: "Liên kết với Lazada",
                              onTap: () {},
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
