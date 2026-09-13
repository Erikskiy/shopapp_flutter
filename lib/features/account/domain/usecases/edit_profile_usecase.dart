import 'package:shopapp/features/account/domain/repositories/account_repository.dart';

class EditProfileUsecase{
  final AccountRepository accountRepository;

  EditProfileUsecase({
    required this.accountRepository,
  });

  Future<void> call(String name, String avatarUrl) async{
    await accountRepository.editProfile(name, avatarUrl);
  }
}