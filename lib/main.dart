import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/app_constants.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/auth/presentation/ui/login_screen.dart';
import 'package:news_app/features/home/data/Service/news_service.dart';
import 'package:news_app/features/home/logic/cubit/news_cubit.dart';
import 'package:news_app/features/settings/presentation/ui/settings_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/data/servies/auth_servies.dart';
import 'features/auth/logic/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.supabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
              NewsCubit(NewsService())
                ..getNews(),
            ),
            BlocProvider(
              create: (context) =>AuthCubit(AuthServies()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            title: 'News App',
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
