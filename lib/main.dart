import 'package:flutter/material.dart';
import 'package:wux_read/screens/welcome_screen.dart';
import 'package:wux_read/screens/login_screen.dart';
import 'package:wux_read/utils/routes.dart';
import 'package:wux_read/screens/signup_screen.dart';
import 'package:wux_read/screens/home_screen.dart';
import 'package:wux_read/widgets/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routes: {
        "/": (context) => WelcomeScreen(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
        MyRoutes.signUpRoute: (context) => SignUpScreen(),
        MyRoutes.homeRoute: (context) => HomeScreen()
      },
    );
  }
}
