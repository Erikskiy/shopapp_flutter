import 'package:shopapp/features/account/data/datasources/remote/account_firebase_datasource.dart';
import 'package:shopapp/features/account/domain/entities/current_user_entity.dart';
import 'package:shopapp/features/account/domain/repositories/account_repository.dart';

class AccountRepositoryImpl extends AccountRepository{
  final AccountFirebaseDatasource accountFirebaseDatasource;

  AccountRepositoryImpl({
    required this.accountFirebaseDatasource,
  });

  @override
  Future<void> addProfile(String name, String email) async{
    await accountFirebaseDatasource.addProfile(name, email);
  }

  @override
  Future<void> editProfile(String name, String avatarUrl) async{
    await accountFirebaseDatasource.editProfile(name, avatarUrl);
  }

  @override
  Future<CurrentUserEntity> getCurrentUserData() async {
    return await accountFirebaseDatasource.getCurrentUserData();
  }
}