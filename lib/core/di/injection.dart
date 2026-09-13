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
}