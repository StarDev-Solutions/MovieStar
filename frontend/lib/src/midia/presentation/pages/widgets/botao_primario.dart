import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';

class BotaoPrimario extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const BotaoPrimario({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: const Alignment(0.5, 1),
              colors: [colorPrimary, colorSecondary],
            ).createShader(bounds);
          },
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 16.s2, vertical: 8.s2),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: UIText.primaryButtonStyle(text),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 15.s3,
                width: 110.s3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colorPrimary.withValues(alpha: 0.5),
                      blurRadius: 20,
                      spreadRadius: 10,
                      offset: const Offset(20, 0)
                    ),
                  ],
                ),
              ),
              Container(
                height: 15.s3,
                width: 110.s3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colorSecondary.withValues(alpha: 0.5),
                      blurRadius: 20,
                      spreadRadius: 10,
                      offset: const Offset(-20, 0)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
