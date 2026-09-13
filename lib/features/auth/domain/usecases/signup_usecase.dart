import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';

class SignupUsecase {
  final AuthRepository authRepository;

  SignupUsecase({
    required this.authRepository,
  });

  Future<void> call(String email, String password1, String password2) async{
    if(password1 == password2){
      await authRepository.signup(email, password1);
    }
  }
}