import 'package:comix_nook/Login_Screen/login_screen.dart';
import 'package:comix_nook/formscreen/form_screen.dart';
import 'package:comix_nook/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {

    final arg = settings.arguments;
    switch (settings.name) {

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case FormScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FormScreen());

      default:
        _onPageNotFound();
    }
  }
  static Route<dynamic> _onPageNotFound() {
    return MaterialPageRoute(

      builder: (_) => const Scaffold(body: Text("Page not found")),

    );
  }
}