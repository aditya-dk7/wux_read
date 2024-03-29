import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/routes.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Image.asset(
            "assets/images/welcome_image.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 40.0),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                            Fluttertoast.showToast(
                            msg: "You can't register a user for now. Contact the developer!!!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            fontSize: 16.0);

                      },
                      child: const Text("New User? Register Here!")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.loginRoute);
                      },
                      child: const Text("Existing User? Login Here"))
                ],
              ))
        ],
      ))),
    );
  }
}
