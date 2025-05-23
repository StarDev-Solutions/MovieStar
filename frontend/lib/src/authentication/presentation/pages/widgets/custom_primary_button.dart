import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomPrimaryButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [colorPrimary, colorSecondary],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withValues(alpha: 0.4),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(-3, -3),
          ),
          BoxShadow(
            color: colorSecondary.withValues(alpha: 0.4),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBackground,
          foregroundColor: hintColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: hintColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
