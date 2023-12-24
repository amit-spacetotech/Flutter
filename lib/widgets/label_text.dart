import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  const LabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: '*',
            style: TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 34,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
