import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/signup_usecase.dart';
import 'package:shopapp/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final SignupUsecase signupUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;

  AuthCubit({
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.signupUsecase,
    required this.getCurrentUserUsecase,
  }):super(AuthInitial());


  Future<void> login(String email, String password) async {
    try{
      emit(AuthLoading());

      await loginUsecase.call(email, password);

      emit(AuthSuccess());
    } catch(e){
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> logout() async {
    try{
      emit(AuthLoading());

      await logoutUsecase.call();

      emit(AuthSuccess());
    }catch(e){
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> signup(String email, String password1, String password2) async{
    try{
      emit(AuthLoading());

      await signupUsecase.call(email, password1, password2);

      emit(AuthSuccess());
    } catch(e){
      emit(AuthError(error: e.toString()));
    }
  }

  String getCurrentUser(){
    try{
      emit(AuthLoading());

      return getCurrentUserUsecase.call();
    } catch(e){
      emit(AuthError(error: e.toString()));
      return e.toString();
    }
  }

}