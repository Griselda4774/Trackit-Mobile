class ValidationUsecase{
  static bool isValidUsername(String username){
    return username != null && username.length >6 && username.contains("@");
  }

  static bool isValidPassword(String pass){
    return pass != null && pass.length >6;
  }
}