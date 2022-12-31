import 'package:flutter/material.dart';

class TextExampleWidget extends StatelessWidget {
  static const text =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      // 'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      // 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
      // 'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
      // 'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
      // 'pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa '
      // 'qui officia deserunt mollit anim id est laborum.'
      //
      ;

  final double height;
  final bool applyHeightToFirstAscent;
  final bool applyHeightToLastDescent;
  final TextLeadingDistribution textLeadingDistribution;

  const TextExampleWidget({
    super.key,
    required this.height,
    required this.applyHeightToFirstAscent,
    required this.applyHeightToLastDescent,
    this.textLeadingDistribution = TextLeadingDistribution.even,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.green[100],
          ),
          child: Text(
            text,
            softWrap: true,
            style: TextStyle(
              color: Colors.red[900],
              height: height,
              backgroundColor: Colors.green[300],
              fontSize: 32,
            ),
            textAlign: TextAlign.start,
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: applyHeightToFirstAscent,
              applyHeightToLastDescent: applyHeightToLastDescent,
              leadingDistribution: textLeadingDistribution,
            ),
          ),
        ),
      ],
    );
  }
}
