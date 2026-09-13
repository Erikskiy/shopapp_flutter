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

class RegistrationScreen extends StatefulWidget{
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController1.dispose();
    passwordController2.dispose();
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
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const SizedBox(height: 150,),

                        const Text(
                          "Registration",
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
                          controller:  passwordController1,
                        ),

                        const SizedBox(height: AppSizes.p16,),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Confirm Password",
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
                          controller:  passwordController2,
                        ),

                        const SizedBox(height: AppSizes.p28,),

                        AuthButton(
                          text: "Sign Up",
                          onPressed: () async{
                            await context.read<AuthCubit>().signup(emailController.text, passwordController1.text, passwordController2.text);
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
                          text: "Sign up with Google",
                          onPressed: () {},
                        ),

                      ],
                    ),

                    Column(
                      children: [

                        const SizedBox(height: AppSizes.p28,),

                        AuthFooterText(
                          questionText: "Already have an account?",
                          buttonText: "Log In",
                          onPressed: () => context.pop(),
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