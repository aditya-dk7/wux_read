import 'package:flutter/material.dart';
import 'package:wux_read/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter username", labelText: "Username"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username cannot be empty!!";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter password", labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password cannot be empty!!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ))),
                  )
                ]),
              )
            ]),
          ),
        )));
  }
}
