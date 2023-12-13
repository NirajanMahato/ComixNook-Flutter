import 'package:flutter/material.dart';
import '../Login_Screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    //
    navigate();
    super.initState();
  }

  void navigate() async{
    await Future.delayed(const Duration(seconds: 3),(){

      Navigator.pushReplacementNamed(context, LoginScreen.routeName) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ComixNookLogo.png")
            ],
          ),
        ),
      )
    );
  }
}
