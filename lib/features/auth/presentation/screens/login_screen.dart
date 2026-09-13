import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/core/di/injection.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopapp/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:shopapp/features/auth/presentation/widgets/auth_footer_text.dart';
import 'package:shopapp/features/auth/presentation/widgets/auth_button.dart';
import 'package:shopapp/features/auth/presentation/widgets/auth_google_sign_in_button.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injection.getAuthCubit(),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingScreen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const SizedBox(height: 150,),

                        const Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: AppSizes.textTitleSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: AppSizes.p24,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppSizes.textDefaultSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        AuthTextfield(
                          prefixIcon: Icons.email,
                          controller: emailController,
                        ),

                        const SizedBox(height: AppSizes.p16,),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppSizes.textDefaultSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        AuthTextfield(
                          prefixIcon: Icons.password,
                          controller: passwordController,
                        ),

                        const SizedBox(height: AppSizes.p28,),

                        AuthButton(
                          text: "Log In",
                          onPressed: () async{
                            await context.read<AuthCubit>().login(emailController.text, passwordController.text);
                            context.go(AppRoutes.homeScreen);
                          },
                        ),

                        const SizedBox(height: AppSizes.p16,),

                        const Text(
                          "or",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: AppSizes.textDefaultSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: AppSizes.p16,),

                        AuthGoogleSignInButton(
                          text: "Log in with Google",
                          onPressed: () {},
                        ),

                      ],
                    ),

                    Column(
                      children: [

                        const SizedBox(height: AppSizes.p28,),

                        AuthFooterText(
                          questionText: "Don't have an account?",
                          buttonText: "Sign Up",
                          onPressed: () => context.push(AppRoutes.registrationScreen),
                        ),

                        const SizedBox(height: AppSizes.p28,),

                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}