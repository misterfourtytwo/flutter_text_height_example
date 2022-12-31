// import 'dart:math';

// import 'package:flutter/material.dart';

// class SnowDrawer extends StatefulWidget {
//   final bool isSnowing;

//   const SnowDrawer({
//     super.key,
//     required this.isSnowing,
//   });

//   @override
//   State<SnowDrawer> createState() => _SnowDrawerState();
// }

// class _SnowDrawerState extends State<SnowDrawer> {
//   late SnowPainter painter;

//   @override
//   void initState() {
//     super.initState();
//     painter = const SnowPainter();
//   }

//   @override
//   void didUpdateWidget(covariant SnowDrawer oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.isSnowing) {
//       painter = const SnowPainter();
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.isSnowing) {
//       return CustomPaint(
//         foregroundPainter: painter,
//         willChange: widget.isSnowing,
//         isComplex: false,
//       );
//     }

//     return const SizedBox.shrink();
//   }
// }

// class Flake {
//   final Offset position;
//   final double size;
//   final double angle;

//   Flake({
//     required this.position,
//     required this.size,
//     required this.angle,
//   });
// }

// class SnowPainter extends CustomPainter {
//   late final rnd = Random(DateTime.now().microsecondsSinceEpoch);

//   SnowPainter();
//   final flakes = <Flake>[flake];

//   @override
//   void paint(Canvas canvas, Size size) {}

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
