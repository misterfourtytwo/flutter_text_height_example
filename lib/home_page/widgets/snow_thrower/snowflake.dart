import 'dart:math' as math;
import 'dart:ui';

final math.Random rnd = math.Random(DateTime.now().microsecondsSinceEpoch);

class Snowflake {
  final int rayCount;
  final double innerRadius;
  final double outerRadius;
  double get totalRadius => innerRadius + outerRadius;

  final Offset position;
  final double rotation;
  final double weight;
  final double spin;

  static const double _rotationAngleSeed = 2 * math.pi / 360 * 30.0;
  factory Snowflake.gen(Size size) {
    int rayCount = rnd.nextInt(7) + 5;
    double innerRadius = 500 * (0.05 * rnd.nextDouble() + 0.02);
    double outerRadius = 500 * (0.05 * rnd.nextDouble() + 0.02);
    double totalRadius = innerRadius + outerRadius;

    Offset spawnPoint = Offset(
      totalRadius +
          math.max(
                0,
                size.width - totalRadius - totalRadius,
              ) *
              rnd.nextDouble(),
      -totalRadius,
    );
    double rotationAngle = _rotationAngleSeed * rnd.nextDouble();
    double weight = rnd.nextDouble() * 0.65 + 0.35;

    double spin = (rnd.nextDouble() - 0.5) * 2;

    return Snowflake(
      rayCount: rayCount,
      innerRadius: innerRadius,
      outerRadius: outerRadius,
      position: spawnPoint,
      rotation: rotationAngle,
      weight: weight,
      spin: spin,
    );
  }

  const Snowflake({
    required this.rayCount,
    required this.innerRadius,
    required this.outerRadius,
    required this.position,
    required this.rotation,
    required this.weight,
    required this.spin,
  });

  static const double _jumpAngleSeed = 2 * math.pi / 360 * 3.0;
  static double get speed => 840.0;
  Snowflake? jump(
    Size size,
    double step,
  ) {
    final double shift = step * weight;
    final newPos = position +
        Offset.fromDirection(
          math.pi * (0.5 + 2 * shift * (rnd.nextDouble() - 0.5)),
          shift * speed,
        );

    /// throw away flakes gone out of bounds
    if (newPos.dx - totalRadius > size.width ||
        newPos.dx + totalRadius < 0 ||
        newPos.dy - totalRadius > size.height) {
      return null;
    }

    final newAngle = rotation + spin / weight * _jumpAngleSeed * shift * 100;

    return copyWith(
      position: newPos,
      rotation: newAngle,
    );
  }

  Snowflake copyWith({
    int? rayCount,
    double? innerRadius,
    double? outerRadius,
    Offset? position,
    double? rotation,
    double? weight,
    double? spin,
  }) {
    return Snowflake(
      rayCount: rayCount ?? this.rayCount,
      innerRadius: innerRadius ?? this.innerRadius,
      outerRadius: outerRadius ?? this.outerRadius,
      position: position ?? this.position,
      rotation: rotation ?? this.rotation,
      weight: weight ?? this.weight,
      spin: spin ?? this.spin,
    );
  }
}
