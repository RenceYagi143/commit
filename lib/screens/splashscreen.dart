import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'onboardingscreen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
    void didChangeDependencies() {
      super.didChangeDependencies();
        precacheImage(const AssetImage('assets/ayoo.jpg'), context).then((value) {
          if (mounted){
            setState((){
          });
        }
        });
      
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ayoo.jpg',
              width: 320,
              height: 320,
            ),
            const SizedBox(height: 10),
            const Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
      nextScreen: const OnboardingScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: const Color(0xFFFB11C8),
      splashIconSize: double.infinity, // This ensures the splash content takes full available space
    );
  }
}
