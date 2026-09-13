import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogleUsecase {
  final AuthRepository authRepository;

  SignInWithGoogleUsecase({
    required this.authRepository,
  });

  Future<void> call(String email, String password) async{

  }
}