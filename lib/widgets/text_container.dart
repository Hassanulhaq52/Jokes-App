import 'package:flutter/material.dart';
import 'package:jokes_app/utils/styles.dart';


class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required this.apiData,
  });

  final String apiData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: Text(
        apiData,
        style: Styles.textContainerStyle,
      ),
    );
  }
}