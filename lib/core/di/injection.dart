import 'package:shopapp/features/account/data/datasources/remote/account_cloudinary_datasource.dart';
import 'package:shopapp/features/account/data/datasources/remote/account_firebase_datasource.dart';
import 'package:shopapp/features/account/data/repositories/account_repository_impl.dart';
import 'package:shopapp/features/account/domain/usecases/add_profile_usecase.dart';
import 'package:shopapp/features/account/domain/usecases/edit_profile_usecase.dart';
import 'package:shopapp/features/account/domain/usecases/get_current_user_data_usecase.dart';
import 'package:shopapp/features/account/domain/usecases/upload_avatar_usecase.dart';
import 'package:shopapp/features/account/presentation/cubit/account_cubit.dart';
import 'package:shopapp/features/auth/data/datasources/remote/auth_firebase_datasource.dart';
import 'package:shopapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:shopapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/signup_usecase.dart';
import 'package:shopapp/features/auth/presentation/cubit/auth_cubit.dart';

class Injection {
  static AuthCubit getAuthCubit(){
    final AuthFirebaseDatasource authFirebaseDatasource = AuthFirebaseDatasource();
    final AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl(authFirebaseDatasource: authFirebaseDatasource);
    final LoginUsecase loginUsecase = LoginUsecase(authRepository: authRepositoryImpl);
    final LogoutUsecase logoutUsecase = LogoutUsecase(authRepository: authRepositoryImpl);
    final SignupUsecase signupUsecase = SignupUsecase(authRepository: authRepositoryImpl);

    return AuthCubit(
      loginUsecase: loginUsecase,
      logoutUsecase: logoutUsecase,
      signupUsecase: signupUsecase,
    );
  }

  static AccountCubit getAccountCubit(){
    final AccountFirebaseDatasource accountFirebaseDatasource = AccountFirebaseDatasource();
    final AccountCloudinaryDatasource accountCloudinaryDatasource = AccountCloudinaryDatasource();
    final AccountRepositoryImpl accountRepositoryImpl = AccountRepositoryImpl(accountFirebaseDatasource: accountFirebaseDatasource, accountCloudinaryDatasource: accountCloudinaryDatasource);

    final AddProfileUsecase addProfileUsecase = AddProfileUsecase(accountRepository: accountRepositoryImpl);
    final EditProfileUsecase editProfileUsecase = EditProfileUsecase(accountRepository: accountRepositoryImpl);
    final GetCurrentUserDataUsecase getCurrentUserDataUsecase = GetCurrentUserDataUsecase(accountRepository: accountRepositoryImpl);
    final UploadAvatarUsecase uploadAvatarUsecase = UploadAvatarUsecase(accountRepository: accountRepositoryImpl);

    return AccountCubit(
      addProfileUsecase: addProfileUsecase,
      editProfileUsecase:  editProfileUsecase,
      getCurrentUserDataUsecase: getCurrentUserDataUsecase,
      uploadAvatarUsecase: uploadAvatarUsecase,
    );
  }
}