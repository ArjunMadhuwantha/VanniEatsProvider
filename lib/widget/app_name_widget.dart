import 'package:flutter/cupertino.dart';
import 'package:servicehub_client/Colors.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: const [
          Text('Vanni',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 31.0,
                color: lightGrey,
                fontWeight: FontWeight.w700,
              )),
          SizedBox(
            width: 5,
          ),
          Text('Eats',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 31.0,
                color: darkText,
                fontWeight: FontWeight.w700,
              ))
        ],
      ),
    );
  }
}
