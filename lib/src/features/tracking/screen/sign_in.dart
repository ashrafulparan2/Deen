import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../routes/routes.dart';

class SignInPage extends StatelessWidget {
  @override
  final _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    String _email = ''; // Add variables to store email and password
    String _password = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Sign In',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, RouteGenerator.Home_Screen);
          },
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15.0,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Sign In Page',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        onChanged: (value) {
                          _email =
                              value; // Update email variable when text changes
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (value) {
                          _password =
                              value; // Update password variable when text changes
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await _auth
                                .signInWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            )
                                .then((value) {
                              Navigator.pushNamed(
                                  context, RouteGenerator.tracking);
                              print("Successfully login");
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(
                                  255, 138, 81, 209)), // Change the color here
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteGenerator.SignUp);
                        },
                        child: Text('Don\'t have an account? Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
