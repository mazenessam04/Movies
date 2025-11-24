import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme/app_theme.dart';
import 'package:movies/presentation/pages/onboarding_page.dart';
import 'package:movies/presentation/screens/splash_screen.dart';
import 'package:movies/core/theme/app_colors/app_colors.dart';
import 'core/routes_manager/routes.dart';
import 'core/ui/auth/login_screen/login_screen.dart';

void main() {
  runApp(MoviesApp());
}
class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "movies",
        initialRoute: Routes.routeName,
        theme: AppTheme.darkTheme,
        routes: {
          //Routes.routeName: (context) => SplashScreen(),
          Routes.routeName: (context) => OnBoardingPage(),
          Routes.routeName: (context) => LoginPage(),

        }
    );

  }
}