import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/account/domain/entities/current_user_entity.dart';
import 'package:shopapp/features/account/domain/usecases/add_profile_usecase.dart';
import 'package:shopapp/features/account/domain/usecases/edit_profile_usecase.dart';
import 'package:shopapp/features/account/domain/usecases/get_current_user_data_usecase.dart';
import 'package:shopapp/features/account/presentation/cubit/account_state.dart';

class AccountCubit extends Cubit<AccountState>{
  final AddProfileUsecase addProfileUsecase;
  final EditProfileUsecase editProfileUsecase;
  final GetCurrentUserDataUsecase getCurrentUserDataUsecase;

  AccountCubit({
    required this.addProfileUsecase,
    required this.editProfileUsecase,
    required this.getCurrentUserDataUsecase,
  }):super(AccountInitial());


  Future<void> addProfile(String name, String email) async{
    try{
      emit(AccountLoading());

      await addProfileUsecase.call(name, email);

      emit(AccountSuccess());
    } catch(e){
      emit(AccountError(error: e.toString()));
    }
  }

  Future<void> editProfile(String name, String avatarUrl) async{
    try{
      emit(AccountLoading());

      await editProfileUsecase.call(name, avatarUrl);

      final CurrentUserEntity currentUserEntity = await getCurrentUserDataUsecase.call();
      emit(AccountLoaded(currentUserEntity: currentUserEntity));
    } catch(e){
      emit(AccountError(error: e.toString()));
    }
  }

  Future<void> getCurrentUserData() async{
    try{
      emit(AccountLoading());

      final CurrentUserEntity currentUserEntity = await getCurrentUserDataUsecase.call();
      emit(AccountLoaded(currentUserEntity: currentUserEntity));
    } catch(e){
      emit(AccountError(error: e.toString()));
    }
  }
}