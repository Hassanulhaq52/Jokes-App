import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jokes_app/screens/home_screen.dart';
import 'package:jokes_app/screens/jokes_screen.dart';
import 'package:jokes_app/screens/signin_screen.dart';

import '../widgets/authentication_button.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  String? password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up Screen'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'images/signup.png',
                    height: 150,
                    width: 150,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EmailField(onchanged: (value) {
                    email = value;
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordField(onchanged: (value) {
                    password = value;
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthenticationButton(
                      colour: Colors.blueAccent,
                      onpressed: () async {
                        try {
                          final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email!, password: password!);
                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const JokesScreen(),
                              ),
                            );
                          }
                          newUser;
                        } catch (e) {
                          print(e);
                        }
                      },
                      title: 'Register'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a Member?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                        child: const Text('Sign In'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}