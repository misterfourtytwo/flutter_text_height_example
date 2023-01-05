import 'package:flutter/material.dart';

import 'home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

const String title = 'Font Height Playground';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColorLight: Colors.indigo,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        sliderTheme: SliderThemeData(
          trackHeight: 10,
          thumbColor: Colors.indigo[800],
        ),
      ),
      home: const HomePage(
        title: title,
      ),
    );
  }
}
