import 'package:shopapp/features/account/domain/entities/current_user_entity.dart';
import 'package:shopapp/features/account/domain/repositories/account_repository.dart';

class GetCurrentUserDataUsecase {
  final AccountRepository accountRepository;

  GetCurrentUserDataUsecase({
    required this.accountRepository,
  });

  Future<CurrentUserEntity> call() async{
    return await accountRepository.getCurrentUserData();
  }
}