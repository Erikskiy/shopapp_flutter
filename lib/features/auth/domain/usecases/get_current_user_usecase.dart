import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUsecase {
  final AuthRepository authRepository;

  GetCurrentUserUsecase({
    required this.authRepository,
  });

  Future<void> call(String email, String password) async{
    await authRepository.getCurrentUser();
  }
}