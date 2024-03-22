import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:register_screen/getx_controler/logincontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  List data = [];

  void _saveForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // fetchdata(context);
      loginController.fetchLogin(username, password, context);
      print("$username - $password");
    }
  }

  void showFailedAPIDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("API Call Failed"),
          content: Text("Failed to load data from the API."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> fetchdata(BuildContext context) async {
    final response = await http.get(Uri.parse(
        'https://www.texasknife.com/dynamic/texasknifeapi.php?action=static_login&email=$username&password=$password'));
    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body)['data'];
      List<String> data = responseData.cast<String>();
    } else {
      print('Failed to load data: ${response.statusCode}');
      showFailedAPIDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.92,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Adjusted mainAxisSize
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.19,
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Image.asset(
                        'assets/TexasImage.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (value) {
                              setState(() {
                                username = value;
                              });
                            },
                            decoration:
                                const InputDecoration(hintText: "Username"),
                            validator: (value) {
                              String pattern =
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                              RegExp regExp = RegExp(pattern);
                              if (value == null || value.isEmpty) {
                                return "please enter Email";
                              } else if (!regExp.hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                            },
                          ),
                          TextFormField(
                            onSaved: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.length < 5) {
                                return "Enter a valid password";
                              }
                            },
                            decoration:
                                const InputDecoration(hintText: "Password"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.indigoAccent,
                      ),
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: TextButton(
                        onPressed: () {
                          _saveForm(context);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    const Text("Don't have an account"),
                    TextButton(
                      onPressed: () {
                        print("SignUp");
                      },
                      child: const Text("Sign Up"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
