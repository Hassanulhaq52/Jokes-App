import 'package:flutter/material.dart';
import 'package:jokes_app/screens/signin_screen.dart';
import 'package:jokes_app/screens/signup_screen.dart';

import '../widgets/authentication_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'images/home_logo.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            AuthenticationButton(
              colour: Colors.lightBlueAccent,
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              title: 'Sign In',
            ),
            const SizedBox(
              height: 20,
            ),
            AuthenticationButton(
              colour: Colors.blueAccent,
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              title: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}
