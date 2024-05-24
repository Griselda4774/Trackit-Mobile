import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackit_mobile__frontend/Presentation/Bloc/LoginBloc/LoginBloc.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Screens/MainPage.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Widgets/ButtonWidget.dart';
import 'package:trackit_mobile__frontend/Presentation/UI/Widgets/TextFieldWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LoginPage> {
  LoginBloc bloc = LoginBloc();

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
                      child: StreamBuilder(
                        stream: bloc.userStream,
                        builder: (context, snapshot) => TextFieldWidget(
                          hinttext: "Email",
                          type: false,
                          controller: _emailController,
                          errortext: snapshot.hasError
                              ? snapshot.error as String
                              : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  //Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: StreamBuilder(
                        stream: bloc.passwordStream,
                        builder: (context, snapshot) => TextFieldWidget(
                          hinttext: "Password",
                          type: true,
                          controller: _passwordController,
                          errortext: snapshot.hasError
                              ? snapshot.error as String
                              : null,
                        ),
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
                            onLoginClicked();
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

  void onLoginClicked() {
    if (bloc.isValidInfo(_emailController.text, _passwordController.text)) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }
  }
}
