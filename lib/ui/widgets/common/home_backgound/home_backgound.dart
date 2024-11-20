import 'package:flutter/material.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';

class HomeBackgound extends StatelessWidget {
  const HomeBackgound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: kcBackgroundPrimaryColor,
      child: CustomPaint(
        painter: _BackgroundPainter(),
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..shader = const RadialGradient(
        colors: [
          kcBackgroundSecundaryColor, // Centro con alta opacidad
          Color.fromARGB(0, 255, 255, 255), // Centro con alta opacidad
        ],
        stops: [0, 1],
      ).createShader(Rect.fromCenter(
        center: const Offset(0, 0),
        width: size.width * 0.5,
        height: size.height * 0.5,
      ));

    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(0, 0),
        width: size.width,
        height: size.height,
      ),
      paint1,
    );

    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..shader = const RadialGradient(
        colors: [kcBackgroundSecundaryColor, kcBackgroundPrimaryColor],
        stops: [0.2, 0.7],
      ).createShader(Rect.fromCenter(
        center: Offset(size.width * 0.8, size.height * 0.4),
        width: size.width,
        height: size.height,
      ));

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.8, size.height * 0.4),
        width: size.width,
        height: size.height,
      ),
      paint2,
    );

    final paint3 = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        colors: [
          kcBackgroundSecundaryColor.withOpacity(0.30),
          const Color.fromARGB(0, 255, 255, 255),
        ],
        stops: const [0.4, 0.7],
      ).createShader(Rect.fromCenter(
        center: Offset(size.width, size.height),
        width: size.width * 1.5,
        height: size.height * 1.5,
      ));

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width, size.height),
        width: size.width * 1.5,
        height: size.height * 1.5,
      ),
      0,
      360,
      true,
      paint3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
