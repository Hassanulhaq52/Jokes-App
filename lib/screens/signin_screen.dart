import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jokes_app/screens/jokes_screen.dart';
import 'package:jokes_app/screens/signup_screen.dart';

import '../widgets/authentication_button.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In Screen'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'images/signin.png',
                    height: 150,
                    width: 150,
                    color: Colors.lightBlueAccent,
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
                      colour: Colors.lightBlueAccent,
                      onpressed: () async {
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email!, password: password!);
                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JokesScreen(),
                              ),
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      title: 'Sign In'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont you have an Account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text('Sign Up'),
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
