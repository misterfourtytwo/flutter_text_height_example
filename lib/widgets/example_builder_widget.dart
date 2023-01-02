import 'package:flutter/material.dart';

import 'widgets.dart';

class ExampleBuilderWidget extends StatefulWidget {
  const ExampleBuilderWidget({super.key});

  @override
  State<ExampleBuilderWidget> createState() => _ExampleBuilderWidgetState();
}

class _ExampleBuilderWidgetState extends State<ExampleBuilderWidget> {
  static get _switchLabelTextStyle => const TextStyle(
        color: Colors.indigoAccent,
        fontSize: 20.0,
      );

  double height = 1;
  bool applyHeightToFirstAscent = true;
  bool applyHeightToLastDescent = true;
  TextLeadingDistribution textLeadingDistribution =
      TextLeadingDistribution.proportional;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 42,
        vertical: 24.0,
      ),
      children: [
        Row(
          children: [
            Text(
              'Height: ',
              style: _switchLabelTextStyle,
            ),
            Expanded(
              child: Slider(
                divisions: 14,
                label: 'Value: $height',
                value: height,
                min: 0.5,
                max: 4,
                onChanged: (value) {
                  height = value;
                  setState(() {});
                },
              ),
            ),
            Text(
              height.toStringAsFixed(2),
              style: _switchLabelTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Divider(
          height: 4,
          color: Colors.indigoAccent[100],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Text(
                'Apply Height To First Ascent:',
                style: _switchLabelTextStyle,
              ),
            ),
            Switch(
              value: applyHeightToFirstAscent,
              onChanged: (value) {
                applyHeightToFirstAscent = value;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Divider(
          height: 4,
          color: Colors.indigoAccent[100],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Text(
                'Apply Height To Last Descent:',
                style: _switchLabelTextStyle,
              ),
            ),
            Switch(
              value: applyHeightToLastDescent,
              onChanged: (value) {
                applyHeightToLastDescent = value;
                setState(() {});
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Divider(
          height: 4,
          color: Colors.indigoAccent[100],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Leading Distribution: ${textLeadingDistribution.name}',
                style: _switchLabelTextStyle,
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 120),
              child: Slider(
                divisions: TextLeadingDistribution.values.length - 1,
                label: textLeadingDistribution.name,
                value: textLeadingDistribution.index.toDouble(),
                min: 0,
                max: TextLeadingDistribution.values.length.toDouble() - 1,
                onChanged: (value) {
                  textLeadingDistribution =
                      TextLeadingDistribution.values[value.round()];

                  setState(() {});
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Divider(
          height: 4,
          color: Colors.indigoAccent[100],
        ),
        const SizedBox(height: 42.0),
        TextExampleWidget(
          height: height,
          applyHeightToFirstAscent: applyHeightToFirstAscent,
          applyHeightToLastDescent: applyHeightToLastDescent,
          textLeadingDistribution: textLeadingDistribution,
        ),
      ],
    );
  }
}
