import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/ButtonWidget.dart';
import 'package:trackit_mobile__frontend/UI/Widgets/TextFieldWidget.dart';
import 'package:trackit_mobile__frontend/blocs/loginBloc/login_bloc.dart';
import 'package:trackit_mobile__frontend/blocs/registerBloc/register_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          print("Register success");
        } else if (state is RegisterFailure) {
          print("ERR");
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Title
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),

                      //Password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          child: TextFieldWidget(
                            controller: _usernameController,
                            hintText: "Username",
                            obscureText: false,
                            color: Color(0xffFF7256),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          child: TextFieldWidget(
                            controller: _nameController,
                            hintText: "name",
                            obscureText: false,
                            color: Color(0xffFF7256),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          child: TextFieldWidget(
                            controller: _passwordController,
                            hintText: "Password",
                            obscureText: true,
                            color: Color(0xffFF7256),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      //Login
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ButtonWidget(
                          text: "Sign up",
                          onTap: () {
                            context.read<RegisterBloc>().add(
                                  RegisterUserEvent(
                                    name: _nameController.text,
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          },
                          color: Color(0xffFF7256),
                        ),
                      ),
                      SizedBox(height: 30),
                      //Create accout?
                      //Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Text("Đăng nhập"),
                            onTap: () {
                              context.pushNamed('login');
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
