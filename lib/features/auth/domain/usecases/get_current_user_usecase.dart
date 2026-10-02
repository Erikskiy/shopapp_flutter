import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUsecase {
  final AuthRepository authRepository;

  GetCurrentUserUsecase({
    required this.authRepository,
  });

  String call(){
    return authRepository.getCurrentUser();
  }
}