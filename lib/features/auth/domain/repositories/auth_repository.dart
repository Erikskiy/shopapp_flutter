abstract class AuthRepository {

  Future<void> signup(String email, String password);

  Future<void> login(String email, String password);

  Future<void> logout();

  String getCurrentUser();
}