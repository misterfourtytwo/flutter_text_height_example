import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'snowflake.dart';

class SnowThrower extends StatefulWidget {
  final bool isSnowing;

  const SnowThrower({
    super.key,
    required this.isSnowing,
  });

  @override
  State<SnowThrower> createState() => _SnowThrowerState();
}

class _SnowThrowerState extends State<SnowThrower>
    with SingleTickerProviderStateMixin {
  late AnimationController ctrl = AnimationController(vsync: this);
  late Size _size;

  List<Snowflake> flakes = <Snowflake>[];

  @override
  void initState() {
    super.initState();

    ctrl.addListener(_flakeGenerator);

    if (widget.isSnowing) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _start(),
      );
    }
  }

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  static const Duration _medianFlakeSpawnPeriod = Duration(seconds: 3);
  DateTime _lastFlake = DateTime(0);

  bool _spawnThrow() {
    if ((DateTime.now().difference(_lastFlake) - _medianFlakeSpawnPeriod)
            .inMilliseconds >
        rnd.nextDouble() * 32000) {
      _lastFlake = DateTime.now();
      return true;
    }
    return false;
  }

  double _oldValue = 0;
  void _flakeGenerator() {
    if (ctrl.isAnimating) {
      double step = ctrl.value - _oldValue;
      if (step < 0) step += 1;
      flakes = [
        ...flakes
            .map(
              (flake) => flake.jump(_size, step),
            )
            .whereType<Snowflake>(),
      ];

      if (_spawnThrow()) {
        flakes.add(
          Snowflake.gen(_size),
        );
      }
      _oldValue = ctrl.value;
    }
    setState(() {});
  }

  void _reset() {
    ctrl.reset();
    flakes.clear();
    _lastFlake = DateTime(0);
    _oldValue = 0;
  }

  void _start() {
    ctrl.repeat(
      period: const Duration(seconds: 20),
    );
  }

  @override
  void didUpdateWidget(covariant SnowThrower oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isSnowing != oldWidget.isSnowing) {
      if (!widget.isSnowing) {
        _reset();
      } else {
        _start();
      }
    }
  }

  @override
  void dispose() {
    ctrl.removeListener(_flakeGenerator);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSnowing) {
      return CustomPaint(
        foregroundPainter: SnowPainter(flakes),
        willChange: widget.isSnowing,
        isComplex: false,
      );
    }

    return const SizedBox.shrink();
  }
}

class SnowPainter extends CustomPainter {
  SnowPainter(
    this.snowflakes,
  );
  final List<Snowflake> snowflakes;

  static const double _flakeOpacity = 0.66;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Path outlinePath = Path();
    Path shadowPath = Path();

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue[50]!.withOpacity(_flakeOpacity)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.4;

    Paint outlinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue[100]!.withOpacity(_flakeOpacity)
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 3.2;

    Paint shadowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.blue[200]!.withOpacity(_flakeOpacity)
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 2;

    for (Snowflake snowflake in snowflakes) {
      final double angleDelta = 2 * math.pi / snowflake.rayCount;
      final double deltaHalf = angleDelta * 0.8;

      for (int i = 1; i <= snowflake.rayCount; i++) {
        final double angle = angleDelta * i + snowflake.rotation;

        final rayEnd = snowflake.position +
            Offset.fromDirection(angle, snowflake.innerRadius);

        final branchEnds = [
          rayEnd +
              Offset.fromDirection(
                angle - deltaHalf,
                snowflake.outerRadius,
              ),
          rayEnd + Offset.fromDirection(angle, snowflake.outerRadius * 0.4),
          rayEnd +
              Offset.fromDirection(
                // math.pi * 2 -
                angle + deltaHalf,
                snowflake.outerRadius,
              ),
        ];

        /// central rays
        path
          ..addOval(
            Rect.fromCircle(center: snowflake.position, radius: 3),
          )
          ..addPolygon(
            [
              snowflake.position,
              rayEnd,
            ],
            false,
          );

        /// outline rays
        outlinePath.addOval(
          Rect.fromCircle(center: rayEnd, radius: 2),
        );
        outlinePath.addPolygon(
          [
            rayEnd,
            ...branchEnds.expand(
              (p) => [p, rayEnd],
            ),
          ],
          false,
        );

        for (var branchEnd in branchEnds) {
          shadowPath.addOval(
            Rect.fromCircle(center: branchEnd, radius: 1.4),
          );
        }
      }
    }
    canvas.drawPath(path, paint);
    canvas.drawPath(outlinePath, outlinePaint);
    canvas.drawPath(shadowPath, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
