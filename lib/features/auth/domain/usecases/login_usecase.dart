import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase({
    required this.authRepository,
  });

  Future<void> call(String email, String password)async {
    await authRepository.login(email, password);
  }
}