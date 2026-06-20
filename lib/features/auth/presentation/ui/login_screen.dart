import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/auth/logic/auth_cubit.dart';
import 'package:news_app/features/auth/presentation/ui/forgot_password_screen.dart';
import 'package:news_app/features/auth/presentation/ui/register_screen.dart';
import 'package:news_app/shared/widgets/custom_elvat_bt.dart';
import 'package:news_app/shared/widgets/custom_row_data.dart';
import 'package:news_app/shared/widgets/custom_text_form_field.dart';
import 'package:news_app/shared/widgets/social_login_button.dart';

import '../../../home/presentation/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "NovaNews",
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: AppColors.primary,
                      fontSize: 35.sp,
                    ),
                  ),
                  Text(
                    "Intelligence in Motion",
                    style: AppTextStyles.labelLarge.copyWith(
                        letterSpacing: 1.5),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 500.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(height: 15.sp),
                          Text(
                            "Welcome Back`",
                            style: AppTextStyles.headlineMedium,
                          ),
                          Text(
                            "Access your personalized briefing.",
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Work Email",
                              style: AppTextStyles.labelLarge,
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          CustomTextFormField(
                            controller: _emailController,
                            hintText: "Name@company.com",
                            hintStyle: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textLight,
                            ),
                            backgroundColor: AppColors.background,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.sp),
                          CustomRowData(
                            text: "Password",
                            style: AppTextStyles.labelLarge,
                            btStyle: AppTextStyles.labelMedium,
                            textButton: 'Forgot Password?',
                            screenName: ForgotPasswordScreen(),
                          ),
                          CustomTextFormField(
                            controller: _passwordController,
                            backgroundColor: AppColors.background,
                            hintText: "••••••••",
                            hintStyle: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textLight,
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            isObscureText: true,
                          ),
                          SizedBox(height: 25.sp),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                             if(state is AuthSuccess){
                               ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                     content: Text("Login Success", style: TextStyle(color: AppColors.success)),
                                     backgroundColor: Colors.white,
                                   ));
                             }else if(state is AuthError){
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                     content: Text(state.message, style: TextStyle(color: AppColors.error)),
                                     backgroundColor: Colors.white,
                                   ),
                                 );
                             }
                            },
                            builder: (context, state) {
                              if(state is AuthLoading){
                                return const Center(child: CircularProgressIndicator(color: AppColors.primary,));
                              }
                              return CustomButton(
                                  text: "Login ->", onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                      context.read<AuthCubit>().login(_emailController.text.trim(), _passwordController.text);
                                    }
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                              });
                            },
                          ),
                          SizedBox(height: 20.sp),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(color: AppColors.textLight),
                              ),
                              Text(
                                " OR CONTINUE WITH ",
                                style: AppTextStyles.labelMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Expanded(
                                child: Divider(color: AppColors.textLight),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SocialLoginButton(
                                text: "GOOGLE",
                                iconPath: AppAssets.googleIcon,
                                onPressed: () {},
                              ),

                              SocialLoginButton(
                                text: "LinkedIn",
                                iconPath: AppAssets.linkedinIcon,
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 20.sp),
                          CustomRowData(
                            text: "Don't have an account?",
                            textButton: 'Sign Up',
                            screenName: RegisterScreen(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    textAlign: TextAlign.center,
                    "© 2024 NovaNews Media Group. All rights reserved.Privacy Policy • Terms of Service",
                    style: AppTextStyles.labelLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
