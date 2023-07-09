import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({super.key,
    required this.colour,
    required this.onpressed,
    required this.title,
  });

  final Color colour;
  final VoidCallback onpressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: colour,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onpressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}