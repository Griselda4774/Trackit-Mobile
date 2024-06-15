part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent{
  final String name;
  final String username;
  final String password;

  RegisterUserEvent({required this.name, required this.username, required this.password});
}
