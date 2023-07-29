import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff99000000),
          borderRadius: BorderRadius.circular(29)),
      height: 187,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 33,
          ),
          Row(
            children: const [
              SizedBox(
                width: 33,
              ),
              Text(
                'Vanni',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 31.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Eats',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 31.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 140,
              ),
              const Text('What do you want ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 23.0,
                    color: Kyellow,
                    fontWeight: FontWeight.w900,
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 170,
              ),
              const Text('for ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 23.0,
                    color: Kyellow,
                    fontWeight: FontWeight.w900,
                  )),
              const Text('Dinner  ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 23.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
