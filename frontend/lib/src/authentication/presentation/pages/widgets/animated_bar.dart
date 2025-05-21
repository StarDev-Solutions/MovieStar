import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final bool isActive;

  const AnimatedBar({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: Color(0xff81B4FF),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
