import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme/app_theme.dart';
import 'package:movies/presentation/screens/splash_screen.dart';

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
      initialRoute: SplashScreen.routeName,
      theme: AppTheme.darkTheme,

    );
  }
}