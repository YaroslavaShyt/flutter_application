import 'package:flutter/material.dart';
import 'package:flutter_application/core/colors.dart';

class SendButton extends StatelessWidget {
  final onPressed;
  const SendButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: const Color(0xFF986D8E),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 50),
      ),
      child: const Text(
        'Send',
        style: TextStyle(
            color: whiteColor, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
