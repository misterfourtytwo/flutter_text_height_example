import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'text_settings_widget.dart';

class TextExampleWidget extends StatelessWidget {
  const TextExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Align(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: math.min(480.0, size.maxWidth),
            ),
            child: const TextSettingsWidget(),
          ),
        );
      },
    );
  }
}
