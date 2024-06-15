import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trackit_mobile__frontend/repositories/authRepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginUserEvent>(_onLoginUserEvent);
  }

  Future<void> _onLoginUserEvent(LoginUserEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final response = await authRepository.login(event.username, event.password);
      if (response == "Login successfully!") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(response));
      }
    } catch (e) {
      emit(LoginFailure("Error: $e"));
    }
  }
}
