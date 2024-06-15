import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackit_mobile__frontend/blocs/loginBloc/login_bloc.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/ButtonWidget.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/TextFieldWidget.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.goNamed('home');
        } else if (state is LoginFailure) {
          print("a");
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.grey.shade100,
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFieldWidget(
                            controller: _usernameController,
                            hintText: "Username",
                            obscureText: false,
                            color: Color(0xffFF7256),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFieldWidget(
                            controller: _passwordController,
                            hintText: "Password",
                            obscureText: true,
                            color: Color(0xffFF7256),
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: ButtonWidget(
                            text: "Login",
                            onTap: () {
                              context.read<LoginBloc>().add(
                                    LoginUserEvent(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            },
                            color: Color(0xffFF7256),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Text("Create an account"),
                              onTap: () {
                                context.pushNamed('signup');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state is LoginLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
    );
  }
}
