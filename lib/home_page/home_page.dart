import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSnowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
            child: const TextExampleWidget(),
          ),
          Positioned(
            height: kToolbarHeight,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).padding.top,
            child: HomeAppBar(
              title: widget.title,
              isSnowing: isSnowing,
              toggleSnow: (value) {
                isSnowing = value;
                setState(() {});
              },
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
