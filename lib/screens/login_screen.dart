import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wux_read/screens/home_screen.dart';
import 'package:wux_read/services/auth_service.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool changeButton = false;
  late String username, password, token;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (!isLoading) {
        AuthService().login(username, password).then((val) async {
          if (val.data['message'] == "Auth successful") {
            token = val.data['token'];
            await storage.write(key: "wuxReadToken", value: token);
            setState(() {
              changeButton = true;
            });
            await Future.delayed(const Duration(seconds: 1));
            Fluttertoast.showToast(
                msg: "Welcome Back!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16.0);
            Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => HomeScreen(token)), (route) => false);
            isLoading = false;
          } else {
            isLoading = false;
          }
        });
      }
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
                    decoration: const InputDecoration(
                        hintText: "Enter username", labelText: "Username"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username cannot be empty!!";
                      }else if(value.isNotEmpty){
                        username = value;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter password", labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password cannot be empty!!";
                      }else if(value.isNotEmpty){
                        password = value;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
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
