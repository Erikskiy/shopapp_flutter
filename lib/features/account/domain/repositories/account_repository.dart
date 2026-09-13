abstract class AccountRepository {
  Future<void> addProfile(String name);

  Future<void> editProfile(String name, String avatarUrl);

  //Future<String> getCurrentUserName();
}