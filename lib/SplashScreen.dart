import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'MainPage.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF292D29)),

        debugShowCheckedModeBanner: false,
        // theme: ,
        home: AnimatedSplashScreen(


          duration: 3000,
          splash: "img/Logo.png",
          splashIconSize: 200,
          nextScreen: HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Color(0xFF000000),

        )
    );
  }
}
