import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wux_read/screens/home_screen.dart';

import '../utils/routes.dart';

class InitCheckScreen extends StatefulWidget {
  const InitCheckScreen({Key? key}) : super(key: key);

  @override
  State<InitCheckScreen> createState() => _InitCheckScreenState();
}

class Arguments{
  final String token;
  Arguments(this.token);
}

class _InitCheckScreenState extends State<InitCheckScreen> {
  final storage = const FlutterSecureStorage();
  late String token;

  Future<String> getSavedSessionToken() async {
    String? value = await storage.read(key: "wuxReadToken");
    if (value != null && value.isNotEmpty) {
      return token = value;
    } else {
      throw Exception("Token Not Found!!");
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      try {
        token = await getSavedSessionToken();
        //TODO: Move to home screen
        Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => HomeScreen(token)), (route) => false);
      } on Exception {
        Navigator.of(context).pushNamedAndRemoveUntil(
            MyRoutes.welcomeScreenRoute, (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          Flexible(
            child: HomeScreen.circularProgress(),
          )
        ])));
  }
}
