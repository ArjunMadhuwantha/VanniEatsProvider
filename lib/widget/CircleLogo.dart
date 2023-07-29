import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';

class CircleLogo extends StatelessWidget {
  const CircleLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: KOrange,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
