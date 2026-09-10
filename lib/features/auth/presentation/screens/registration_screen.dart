import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
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
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      controller:  passwordController,
                    ),

                    const SizedBox(height: AppSizes.p28,),

                    AuthButton(
                      text: "Sign Up",
                      onPressed: () {},
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
    );
  }
}