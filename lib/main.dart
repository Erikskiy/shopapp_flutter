import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/core/di/injection.dart';
import 'package:shopapp/firebase_options.dart';
import 'package:shopapp/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => Injection.getAuthCubit(),
        ),

        BlocProvider(
          create: (context) => Injection.getAccountCubit(),
        ),

        BlocProvider(
          create: (context) => Injection.getCheckoutCubit(),
        ),

        BlocProvider(
          create: (context) => Injection.getProductCubit()..getMyProducts(),
        )

      ],
      child: MyApp(),
    ),
  );
}