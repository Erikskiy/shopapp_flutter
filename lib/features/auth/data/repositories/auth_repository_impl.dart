import 'package:shopapp/features/auth/data/datasources/remote/auth_firebase_datasource.dart';
import 'package:shopapp/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  final AuthFirebaseDatasource authFirebaseDatasource;

  AuthRepositoryImpl({
    required this.authFirebaseDatasource,
  });

  @override
  Future<void> signup(String email, String password) async{
    await authFirebaseDatasource.signup(email, password);
  }

  @override
  Future<void> login(String email, String password) async{
    await authFirebaseDatasource.login(email, password);
  }

  @override
  String getCurrentUser() {
    return authFirebaseDatasource.getCurrentUser();
  }

  @override
  Future<void> logout() async{
    await authFirebaseDatasource.logout();
  }
}