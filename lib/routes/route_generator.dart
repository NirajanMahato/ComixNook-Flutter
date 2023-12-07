import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {

    final arg = settings.arguments;
    switch (settings.name) {


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