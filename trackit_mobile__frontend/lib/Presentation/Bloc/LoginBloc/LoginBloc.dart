import 'dart:async';

import 'package:trackit_mobile__frontend/Domain/UseCases/LoginUseCase/validationUseCase.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidInfo(String name, String pass) {
    if (!ValidationUsecase.isValidUsername(name)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _userController.sink.add("OK");
    if (!ValidationUsecase.isValidPassword(pass)) {
      _passwordController.sink.addError("mật khẩu không hợp lệ");
      return false;
    }
    _passwordController.sink.add("OK");
    return true;
  }  
}
