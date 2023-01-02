import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Height Playground',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        sliderTheme: SliderThemeData(
          trackHeight: 10,
          thumbColor: Colors.indigo[800],
        ),
      ),
      home: const MyHomePage(
        title: 'Font Height Playground',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSnowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
            child: const ExampleBuilderWidget(),
          ),
          Positioned(
            height: kToolbarHeight,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).padding.top,
            child: Row(
              children: [
                const SizedBox(width: 90),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.title,
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
                  width: 90,
                  child: Switch(
                    value: isSnowing,
                    onChanged: (value) => setState(() => isSnowing = value),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: SnowThrower(isSnowing: isSnowing),
          ),
        ],
      ),
    );
  }
}
