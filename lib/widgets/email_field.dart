
import 'package:flutter/material.dart';


import '../utils/styles.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key, required this.onchanged}) : super(key: key);

  final Function(String) onchanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.emailAddress,
      onChanged: onchanged,
      decoration: Styles.fieldDecoration.copyWith(
        hintText: 'Enter Your Email',
        prefixIcon: Icon(Icons.email_outlined),
      ),
    );
  }
}