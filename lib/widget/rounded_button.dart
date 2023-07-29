import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.buttonText,
      required this.onPress,
      required this.bgcolor});

  final String buttonText;
  final VoidCallback onPress;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Text(
            buttonText,
            style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: KbUTTONTEXT),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // <-- Radius
          ),
        ),
      ),
    );
  }
}
