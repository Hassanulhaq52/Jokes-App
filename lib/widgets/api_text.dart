import 'package:flutter/material.dart';
import 'package:jokes_app/utils/styles.dart';


class ApiText extends StatelessWidget {
  const ApiText({
    super.key,
    required this.apiText,
  });

  final String apiText;

  @override
  Widget build(BuildContext context) {
    return Text(
      apiText,
      style: Styles.apiDataStyle,
    );
  }
}