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
        primarySwatch: Colors.red,
        backgroundColor: Colors.green[900],
        scaffoldBackgroundColor: Colors.green[900],
        sliderTheme: SliderThemeData(
          trackHeight: 10,
          thumbColor: Colors.red[200],
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
  // bool showSnow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.green[100],
            fontWeight: FontWeight.w700,
            fontSize: 28.0,
          ),
        ),
        centerTitle: true,
        actions: [
          // Switch(
          //   value: showSnow,
          //   onChanged: (value) => setState(() => showSnow = value),
          // ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          const Positioned.fill(
            child: SafeArea(
              child: ExampleBuilderWidget(),
            ),
          ),
          // Positioned.fill(
          //   child: SnowDrawer(showSnow: showSnow),
          // ),
        ],
      ),
    );
  }
}
