import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/account/domain/usecases/add_profile_usecase.dart';
import 'package:shopapp/features/account/domain/usecases/edit_profile_usecase.dart';
import 'package:shopapp/features/account/presentation/cubit/account_state.dart';

class AccountCubit extends Cubit<AccountState>{
  final AddProfileUsecase addProfileUsecase;
  final EditProfileUsecase editProfileUsecase;

  AccountCubit({
    required this.addProfileUsecase,
    required this.editProfileUsecase,
  }):super(AccountInitial());


  Future<void> addProfile(String name) async{
    try{
      emit(AccountLoading());

      await addProfileUsecase.call(name);

      emit(AccountSuccess());
    } catch(e){
      emit(AccountError(error: e.toString()));
    }
  }

  Future<void> editProfile(String name, String avatarUrl) async{
    try{
      emit(AccountLoading());

      await editProfileUsecase.call(name, avatarUrl);

      emit(AccountSuccess());
    } catch(e){
      emit(AccountError(error: e.toString()));
    }
  }
}