import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trackit_mobile__frontend/UI/Screens/statisticalScreen.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/ButtonWidget.dart';
import 'package:trackit_mobile__frontend/blocs/profileBloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // final shopeeOrders = context.watch<DataProvider>().shopeeOrders;
    // final lazadaOrders = context.watch<DataProvider>().lazadaOrders;
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailure) {
          print("Err logout");
        } else if (state is ProfileSuccess) {
          context.goNamed("login");
        }
      },
      builder: (context, state) {
        return Stack(children: [
          Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Căn giữa theo trục dọc
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Căn giữa theo trục ngang
                  children: [
                    Container(
                      width: 150, // Đặt kích thước chiều rộng của Container
                      height: 150,
                      child: ClipOval(
                        child: Image.network(
                          'https://down-vn.img.susercontent.com/file/sg-11134201-22090-qukse0nz4vhv3a_tn', // URL của hình ảnh
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Thêm khoảng cách giữa các phần tử
                    Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5), // Thêm khoảng cách giữa các phần tử
                    Text(
                      "example@gmail.com",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 20), // Thêm khoảng cách giữa các phần tử

                    SizedBox(height: 100),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: ButtonWidget(
                          text: "Thống kê chi tiêu",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatisticalScreen()));
                          },
                          color: Color(0xffFF7256)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: ButtonWidget(
                          text: "Đăng xuất",
                          onTap: () {
                            context.read<ProfileBloc>().add(LogOutUser());
                          },
                          color: Color(0xffFF7256)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (state is ProfileLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ]);
      },
    );
  }
}
