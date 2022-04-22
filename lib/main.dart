import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:wux_read/screens/initial_check_screen.dart';
import 'package:wux_read/screens/welcome_screen.dart';
import 'package:wux_read/screens/login_screen.dart';
import 'package:wux_read/utils/routes.dart';
import 'package:wux_read/screens/signup_screen.dart';
import 'package:wux_read/widgets/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      routes: {
        "/": (context) => const InitCheckScreen(),
        MyRoutes.welcomeScreenRoute: (context) => WelcomeScreen(),
        MyRoutes.loginRoute: (context) => const LoginScreen(),
        MyRoutes.signUpRoute: (context) => SignUpScreen()
      },
    );
  }
}
