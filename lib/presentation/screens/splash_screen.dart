import 'package:flutter/material.dart';
import 'package:movies/core/app_images/app_images.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.introLogo,),
                  ]

                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.routeLogo),
                  ],
                ),

              ],
            ),
          )
      ),


    );
  }
}
