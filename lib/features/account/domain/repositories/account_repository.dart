import 'dart:io';

import 'package:shopapp/features/account/domain/entities/current_user_entity.dart';

abstract class AccountRepository {
  Future<void> addProfile(String name, String email);

  Future<void> editProfile(String name, String avatarUrl);

  Future<CurrentUserEntity> getCurrentUserData();

  Future<String> uploadAvatar(File image);
}