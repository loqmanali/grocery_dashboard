import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_dashboard/componant/custom_text.dart';
import 'package:grocery_dashboard/componant/custom_text_field.dart';
import 'package:grocery_dashboard/services/firebase_services.dart';

import '../app_routes.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _formKey = GlobalKey<FormState>();
  FirebaseServices _services = FirebaseServices();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ArsProgressDialog progressDialog = ArsProgressDialog(
      context,
      blur: 2.0,
      backgroundColor: Color(0xff84c225).withOpacity(0.9),
      animationDuration: Duration(milliseconds: 500),
    );

    _login({username, password}) async {
      progressDialog.show();
      _services.getAdminCredentials(username).then((value) async {
        if (value.exists) {
          if (value.data()['username'] == username) {
            if (value.data()['password'] == password) {
              /// if both is correct, will login
              try {
                UserCredential userCredential =
                    await FirebaseAuth.instance.signInAnonymously();
                if (userCredential.user.uid != null) {
                  progressDialog.dismiss();
                  AppNavigator.navigatorTo(context, false, HomeScreen());
                  // return;
                }
              } catch (e) {
                _showMyDialog(title: 'Login', message: e.toString());
              }
              return;
            }

            /// if password incorrect
            progressDialog.dismiss();
            _showMyDialog(
              title: 'Invalid Password',
              message: 'Please Try again',
            );
            return;
          }

          /// if username incorrect
          progressDialog.dismiss();
          _showMyDialog(
            title: 'Invalid Username',
            message: 'Please Try again',
          );
        }
        progressDialog.dismiss();
        _showMyDialog(
          title: 'Invalid Username',
          message: 'Please Try again',
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('', style: TextStyle(color: Colors.white)),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return CustomText(text: snapshot.hasError.toString());
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff84c225),
                    Colors.white,
                  ],
                  stops: [1.0, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment(0.0, 0.0),
                ),
              ),
              child: Center(
                child: Container(
                  height: 300.0,
                  width: 300.0,
                  child: Card(
                    elevation: 5.0,
                    shape: Border.all(color: Colors.green, width: 2.0),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: 'GROCERY ADMIN',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: _usernameTextController,
                                    prefixIcon: Icon(Icons.person_rounded),
                                    hintText: 'User Name',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter User name';
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomTextField(
                                    controller: _passwordTextController,
                                    prefixIcon: Icon(Icons.vpn_key),
                                    hintText: 'Password',
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.length < 6) {
                                        return 'Minimum 6 char';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _login(
                                          username:
                                              _usernameTextController.text,
                                          password:
                                              _passwordTextController.text,
                                        );
                                      }
                                    },
                                    child: Text('Login'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<void> _showMyDialog({String title, String message}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
