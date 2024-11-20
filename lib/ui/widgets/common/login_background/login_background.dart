import 'package:flutter/material.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

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
        stops: [0.1, 0.7],
      ).createShader(Rect.fromCenter(
        center: Offset(size.width, size.height * 0.1),
        width: size.width * 3,
        height: size.height * 8,
      ));

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width, 0),
        width: size.width * 3,
        height: size.height * 8,
      ),
      paint1,
    );

    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..shader = RadialGradient(
        colors: [
          kcBackgroundSecundaryColor.withOpacity(0.33),
          const Color.fromARGB(0, 255, 255, 255),
        ],
        stops: const [0.2, 0.8],
      ).createShader(Rect.fromCenter(
        center: Offset(0, size.height * 0.5),
        width: size.width * 0.8,
        height: size.height * 0.8,
      ));

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(0, size.height / 2),
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
        center: Offset(size.width * 0.5, size.height * 1.1),
        width: size.width * 3,
        height: size.height,
      ));

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height),
        width: size.width,
        height: size.height,
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
