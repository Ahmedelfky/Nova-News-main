import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/auth/logic/auth_cubit.dart';
import 'package:news_app/features/auth/presentation/ui/login_screen.dart';
import 'package:news_app/shared/widgets/custom_elvat_bt.dart';
import 'package:news_app/shared/widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {

    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "NovaNews",
                        style: AppTextStyles.headlineLarge.copyWith(
                          color: AppColors.primary,
                          fontSize: 35.sp,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.help_outline_outlined),
                      ),
                    ],
                  ),
                  SizedBox(height: 88.h),
                  Container(
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Image(
                            height: 50.h,
                            width: 50.h,
                            image: AssetImage(AppAssets.forgotPasswordIcon),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Forgot Password",
                            style: AppTextStyles.headlineLarge,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Lost your way? Enter your email and\nwe'll help you get back to your news.",
                          ),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email Address",
                              style: AppTextStyles.labelLarge,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          CustomTextFormField(
                            controller: _emailController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                            backgroundColor: AppColors.background,
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: 'name@example.com',
                            hintStyle: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textLight,
                            ),
                          ),
                          SizedBox(height: 40.h),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if(state is AuthSuccess){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Reset link sent to your email!", style: TextStyle(color: AppColors.success)),
                                    backgroundColor: Colors.white,
                                  ),
                                );
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              }else if(state is AuthError){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message, style: const TextStyle(color: AppColors.error)),
                                    backgroundColor: Colors.white,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if(state is AuthLoading){
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                );
                              }
                              return CustomButton(
                                text: "Send Reset Link ->",
                                onPressed: () {
                                 if(_formKey.currentState!.validate()){
                                   context.read<AuthCubit>().requestPassword(_emailController.text.trim());
                                 }
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.primary,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Back to Login",
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
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
