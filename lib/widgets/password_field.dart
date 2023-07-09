import 'package:flutter/material.dart';
import 'package:jokes_app/utils/styles.dart';


class PasswordField extends StatelessWidget {
  const PasswordField({Key? key, required this.onchanged}) : super(key: key);

  final Function(String) onchanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.dark,
      obscureText: true,
      onChanged: onchanged,
      decoration: Styles.fieldDecoration.copyWith(
        hintText: 'Enter Your Password',
        prefixIcon: const Icon(Icons.lock),
      ),
    );
  }
}