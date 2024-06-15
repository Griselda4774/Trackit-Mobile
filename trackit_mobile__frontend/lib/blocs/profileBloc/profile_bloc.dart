import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trackit_mobile__frontend/repositories/authRepository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository authRepository;

  ProfileBloc({required this.authRepository}) : super(ProfileInitial()) {
    on<LogOutUser>((event, emit) async {
      // emit(ProfileLoading());
      // try{
      //   final response = await authRepository.logout();
      //   emit(ProfileSuccess());
      // }catch(e){
      //   emit(ProfileFailure(message: e.toString()));
      // }
    });
  }
}
