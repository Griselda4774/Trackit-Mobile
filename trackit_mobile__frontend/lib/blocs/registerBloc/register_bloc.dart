import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trackit_mobile__frontend/repositories/authRepository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;
  RegisterBloc({required this.authRepository}) : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final response = await authRepository.register(
            event.username, event.name, event.password);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterFailure(message: e.toString()));
      }
    });
  }
}
