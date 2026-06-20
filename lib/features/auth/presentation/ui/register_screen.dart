import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/auth/logic/auth_cubit.dart';
import 'package:news_app/features/auth/presentation/ui/login_screen.dart';
import 'package:news_app/shared/widgets/custom_elvat_bt.dart';
import 'package:news_app/shared/widgets/custom_row_data.dart';
import 'package:news_app/shared/widgets/custom_text_form_field.dart';
import 'package:news_app/shared/widgets/social_login_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  Text(
                    "NovaNews",
                    style: AppTextStyles.headlineLarge.copyWith(
                      color: AppColors.primary,
                      fontSize: 35,
                    ),
                  ),
                  CustomRowData(
                    text: "Already have an account?",
                    textButton: 'Login',
                    screenName: LoginScreen(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Join the Inner Circle",
                    style: AppTextStyles.headlineMedium,
                  ),
                  SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    "Experience journalism refined for the modern executive.",
                    style: AppTextStyles.labelLarge.copyWith(
                        letterSpacing: 1.5),
                  ),
                  SizedBox(height: 10.sp),
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.sp),
                          Text(
                            "Full Name",
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          CustomTextFormField(
                            controller: _nameController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                            prefixIcon: Icon(Icons.person_2_outlined),
                            backgroundColor: AppColors.background,
                            hintText: "Alexander Nova",
                            hintStyle: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textLight,
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          Text(
                            "Email",
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          CustomTextFormField(
                            controller: _emailController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                            prefixIcon: Icon(Icons.email_outlined),
                            backgroundColor: AppColors.background,
                            hintText: "Name@email.com",
                            hintStyle: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textLight,
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          Text(
                            "Password",
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          CustomTextFormField(
                            controller: _passwordController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            isObscureText: true,
                            prefixIcon: Icon(Icons.lock_outlined),
                            backgroundColor: AppColors.background,
                            hintStyle: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textLight,
                            ),
                            hintText: "********",
                          ),
                          SizedBox(height: 15.sp),
                          Text(
                            "Confirm",
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          CustomTextFormField(
                            controller: _confirmPasswordController,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter your confirm password";
                              }
                              if (val != _passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            isObscureText: true,
                            prefixIcon: Icon(Icons.lock_outlined),
                            backgroundColor: AppColors.background,
                            hintStyle: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textLight,
                            ),
                            hintText: "********",
                          ),
                          SizedBox(height: 25.sp),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if(state is AuthSuccess){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Account Created Successfully!", style: TextStyle(color: AppColors.success)),
                                    backgroundColor: Colors.white,
                                  ),
                                );
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
                                return const Center(child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ));
                              }
                              return CustomButton(
                                  text: "Create Account", onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                      context.read<AuthCubit>().signUp(
                                         _emailController.text.trim(),
                                         _passwordController.text,
                                        _nameController.text.trim(),
                                      );
                                    }
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
                                text: " Apple ",
                                iconPath: AppAssets.appleIcon,
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 20.sp),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Divider(color: AppColors.textLight),
                  SizedBox(height: 20.sp),
                  Text(
                    '"Knowledge is the only bridge to an informed future."',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    "© 2024 NovaNews Editorial Group. All rights reserved.",
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Global Support",
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        "Press Inquiries",
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        "System Status",
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
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

