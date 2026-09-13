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