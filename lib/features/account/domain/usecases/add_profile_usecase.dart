import 'package:shopapp/features/account/domain/repositories/account_repository.dart';

class AddProfileUsecase{
  final AccountRepository accountRepository;

  AddProfileUsecase({
    required this.accountRepository,
  });

  Future<void> call(String name, String email) async{
    await accountRepository.addProfile(name, email);
  }
}