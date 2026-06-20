import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/auth/data/servies/auth_servies.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthServies authServies;
  AuthCubit(this.authServies) : super(AuthInitial());

  Future<void> login(String email,String password)async{
    emit(AuthLoading());
    try {
      await authServies.loginWithEmail(email: email, password: password);
      emit(AuthSuccess());
    }  catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  Future<void> signUp(String email,String password,String fullName)async{
    emit(AuthLoading());
    try {
      await authServies.signUpWithEmail(fullName: fullName,email: email, password: password);
      emit(AuthSuccess());
    }  catch (e) {
      emit(AuthError(e.toString()));
    }
  }
  Future<void>requestPassword(String email)async{
    emit(AuthLoading());
    try {
      await authServies.resetPassword(email: email);
      emit(AuthSuccess());
    }  catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
