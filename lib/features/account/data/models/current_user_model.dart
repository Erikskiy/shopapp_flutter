import 'package:shopapp/features/account/domain/entities/current_user_entity.dart';

class CurrentUserModel extends CurrentUserEntity {
  CurrentUserModel({
    required super.name,
    required super.email,
    required super.avatarUrl,
  });

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) {
    return CurrentUserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      avatarUrl: json["avatarUrl"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "avatarUrl": avatarUrl,
    };
  }
}