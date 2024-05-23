import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/MainPage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Widgets/ButtonWidget.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Widgets/TextFieldWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Title
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),

                  Text(
                    "Hi! Welcome Back, you've been missed",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 50),

                  //Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: TextFieldWidget(
                        hinttext: "Email",
                        type: false,
                        controller: _emailController,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  //Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: TextFieldWidget(
                        hinttext: "Password",
                        type: true,
                        controller: _passwordController,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  //Login
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: ButtonWidget(
                          text: "Login",
                          ontap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 30),
                  //Create accout?
                  //Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tạo tài khoản"),
                      SizedBox(width: 50),
                      Container(
                        child: Text(
                          "Quên mật khẩu?",
                          style: TextStyle(
                            color: Color(0xFFE75A5A),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
