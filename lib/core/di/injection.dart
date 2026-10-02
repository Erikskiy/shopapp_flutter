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
import 'package:shopapp/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:shopapp/features/auth/domain/usecases/signup_usecase.dart';
import 'package:shopapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopapp/features/checkout/data/datasources/remote/checkout_firebase_datasource.dart';
import 'package:shopapp/features/checkout/data/repositories/checkout_repository_impl.dart';
import 'package:shopapp/features/checkout/domain/usecases/edit_payment_card_details_usecase.dart';
import 'package:shopapp/features/checkout/domain/usecases/edit_shipping_address_usecase.dart';
import 'package:shopapp/features/checkout/domain/usecases/get_payment_card_details_usecase.dart';
import 'package:shopapp/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:shopapp/features/products/data/datasources/remote/product_cloudinary_datasource.dart';
import 'package:shopapp/features/products/data/datasources/remote/product_firebase_datasource.dart';
import 'package:shopapp/features/products/data/repositories/product_repository_impl.dart';
import 'package:shopapp/features/products/domain/usecases/add_product_usecase.dart';
import 'package:shopapp/features/products/domain/usecases/get_my_products_usecase.dart';
import 'package:shopapp/features/products/domain/usecases/upload_product_image_usecase.dart';
import 'package:shopapp/features/products/presentation/cubit/product_cubit.dart';

class Injection {
  static AuthCubit getAuthCubit(){
    final AuthFirebaseDatasource authFirebaseDatasource = AuthFirebaseDatasource();
    final AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl(authFirebaseDatasource: authFirebaseDatasource);
    final LoginUsecase loginUsecase = LoginUsecase(authRepository: authRepositoryImpl);
    final LogoutUsecase logoutUsecase = LogoutUsecase(authRepository: authRepositoryImpl);
    final SignupUsecase signupUsecase = SignupUsecase(authRepository: authRepositoryImpl);
    final GetCurrentUserUsecase getCurrentUserUsecase = GetCurrentUserUsecase(authRepository: authRepositoryImpl);

    return AuthCubit(
      loginUsecase: loginUsecase,
      logoutUsecase: logoutUsecase,
      signupUsecase: signupUsecase,
      getCurrentUserUsecase: getCurrentUserUsecase,
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

  static CheckoutCubit getCheckoutCubit(){
    final CheckoutFirebaseDatasource checkoutFirebaseDatasource = CheckoutFirebaseDatasource();
    final CheckoutRepositoryImpl checkoutRepositoryImpl = CheckoutRepositoryImpl(checkoutFirebaseDatasource: checkoutFirebaseDatasource);

    final EditPaymentCardDetailsUsecase editPaymentCardDetailsUsecase = EditPaymentCardDetailsUsecase(checkoutRepository: checkoutRepositoryImpl);
    final EditShippingAddressUsecase editShippingAddressUsecase = EditShippingAddressUsecase(checkoutRepository: checkoutRepositoryImpl);
    final GetPaymentCardDetailsUsecase getPaymentCardDetailsUsecase = GetPaymentCardDetailsUsecase(checkoutRepository: checkoutRepositoryImpl);

    return CheckoutCubit(
      getPaymentCardDetailsUsecase: getPaymentCardDetailsUsecase,
      editShippingAddressUsecase: editShippingAddressUsecase,
      editPaymentCardDetailsUsecase: editPaymentCardDetailsUsecase,
    );
  }

  static ProductCubit getProductCubit(){
    final ProductFirebaseDatasource productFirebaseDatasource = ProductFirebaseDatasource();
    final ProductCloudinaryDatasource productCloudinaryDatasource = ProductCloudinaryDatasource();
    final ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl(productFirebaseDatasource: productFirebaseDatasource, productCloudinaryDatasource: productCloudinaryDatasource);

    final AddProductUsecase addProductUsecase = AddProductUsecase(productRepository: productRepositoryImpl);
    final UploadProductImageUsecase uploadProductImageUsecase = UploadProductImageUsecase(productRepository: productRepositoryImpl);
    final GetMyProductsUsecase getMyProductsUsecase = GetMyProductsUsecase(productRepository: productRepositoryImpl);

    return ProductCubit(
      addProductUsecase: addProductUsecase,
      uploadProductImageUsecase: uploadProductImageUsecase,
      getMyProductsUsecase: getMyProductsUsecase,
    );
  }
}