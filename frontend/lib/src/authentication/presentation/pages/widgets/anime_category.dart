import 'package:flutter/material.dart';
import 'package:frontend/src/core/theme/ui_helpers/ui_helper.dart';

class AnimeCategory extends StatelessWidget {
  const AnimeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 190,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(160, 140),
            painter: BackgroundPainter(),
          ),
          Positioned(
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.categoryLabel('Animes'),
                UIText.quantityTitlesLabel('532 Titles'),
              ],
            ),
          ),
          Positioned(
            top: -35,
            right: 2,
            child: Image.asset(
              'assets/images/midoria.png',
              width: 122,
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 40;
    final Path path = Path();

    path.moveTo(radius, -8);
    path.quadraticBezierTo(0, -16, 0, 30);
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(0, size.height, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - radius);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width, 0, size.width - radius, 0);

    // Preenchimento com gradiente azul
    final paint =
        Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF2E2E),
              Color(0xFFE08939),
            ],
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(Path.from(path), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
