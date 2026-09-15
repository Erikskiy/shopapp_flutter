import 'dart:io';

import 'package:shopapp/features/account/domain/repositories/account_repository.dart';

class UploadAvatarUsecase {
  final AccountRepository accountRepository;

  UploadAvatarUsecase({
    required this.accountRepository,
  });

  Future<String> call(File image) async{
    return await accountRepository.uploadAvatar(image);
  }
}