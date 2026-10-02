import 'package:go_router/go_router.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/account/presentation/screens/my_account_screen.dart';
import 'package:shopapp/features/account/presentation/screens/my_profile_edit_screen.dart';
import 'package:shopapp/features/auth/presentation/screens/login_screen.dart';
import 'package:shopapp/features/auth/presentation/screens/registration_screen.dart';
import 'package:shopapp/features/cart/presentation/screens/my_cart_screen.dart';
import 'package:shopapp/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:shopapp/features/checkout/presentation/screens/order_success_screen.dart';
import 'package:shopapp/features/checkout/presentation/screens/payment_settings_screen.dart';
import 'package:shopapp/features/checkout/presentation/screens/shipping_address_screen.dart';
import 'package:shopapp/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:shopapp/features/home/presentation/screens/home_screen.dart';
import 'package:shopapp/features/navigation/presentation/screens/navigation_screen.dart';
import 'package:shopapp/features/products/presentation/screens/add_product_screen.dart';
import 'package:shopapp/features/products/presentation/screens/my_products_screen.dart';
import 'package:shopapp/features/products/presentation/screens/product_details_screen.dart';
import 'package:shopapp/features/settings/presentation/screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.loginScreen,
  routes: [

    GoRoute(
      path: AppRoutes.loginScreen,
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: AppRoutes.registrationScreen,
      builder: (context, state) => RegistrationScreen(),
    ),

    GoRoute(
      path: AppRoutes.productDetailsScreen,
      builder: (context, state) => ProductDetailsScreen(),
    ),

    GoRoute(
      path: AppRoutes.addProductScreen,
      builder: (context, state) => AddProductScreen(),
    ),

    GoRoute(
      path: AppRoutes.settingsScreen,
      builder: (context, state) => SettingsScreen(),
    ),

    GoRoute(
      path: AppRoutes.shippingAddressScreen,
      builder: (context, state) => ShippingAddressScreen(),
    ),

    GoRoute(
      path: AppRoutes.paymentSettingsScreen,
      builder: (context, state) => PaymentSettingsScreen(),
    ),

    GoRoute(
      path: AppRoutes.checkoutScreen,
      builder: (context, state) => CheckoutScreen(),
    ),

    GoRoute(
      path: AppRoutes.myProfileEditScreen,
      builder: (context, state) => MyProfileEditScreen(),
    ),

    GoRoute(
      path: AppRoutes.orderSuccessScreen,
      builder: (context, state) => OrderSuccessScreen(),
    ),



    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell,) {
        return NavigationScreen(navigationShell: navigationShell);
      },
      branches: [

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.homeScreen,
              builder: (context, state) => HomeScreen(),
            ),
          ]
        ),

        StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.myProductsScreen,
                builder: (context, state) => MyProductsScreen(),
              ),
            ]
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.myCartScreen,
              builder: (context, state) => MyCartScreen(),
            ),
          ]
        ),

        StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.favoritesScreen,
                builder: (context, state) => FavoritesScreen(),
              ),
            ]
        ),

        StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.myAccountScreen,
                builder: (context, state) => MyAccountScreen(),
              ),
            ]
        ),

      ]
    ),

  ]
);