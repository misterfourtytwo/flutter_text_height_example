import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  static const double _pad = 100.0;

  const HomeAppBar({
    Key? key,
    required this.title,
    required this.isSnowing,
    required this.toggleSnow,
  }) : super(key: key);

  final String title;
  final bool isSnowing;
  final ValueSetter<bool> toggleSnow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: _pad),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.w700,
                fontSize: 36.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          width: _pad,
          child: Row(
            children: [
              const SizedBox(width: 25),
              Icon(
                CupertinoIcons.wind_snow,
                color: Colors.indigo[800],
                size: 15.0,
              ),
              Switch(
                value: isSnowing,
                onChanged: toggleSnow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
