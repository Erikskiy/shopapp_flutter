import 'package:shopapp/features/account/domain/entities/current_user_entity.dart';

abstract class AccountState {}

class AccountInitial extends AccountState{}

class AccountLoading extends AccountState{}

class AccountSuccess extends AccountState{}

class AccountError extends AccountState{
  final String error;

  AccountError({
    required this.error,
  });
}

class AccountLoaded extends AccountState{
  final CurrentUserEntity currentUserEntity;

  AccountLoaded({
    required this.currentUserEntity,
  });
}