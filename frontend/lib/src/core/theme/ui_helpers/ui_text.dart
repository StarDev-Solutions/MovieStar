import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class UIText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final TextAlign? textAlign; 

  UIText.label(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = labelStyle;
  
  UIText.categoryLabel(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = categoryLabelStyle;
  UIText.quantityTitlesLabel(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = quantityTitlesLabelStyle;
  
  UIText.contentTitle(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = contentTitleStyle;
  UIText.releaseDate(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = releaseDateStyle;

  UIText.excerpt(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = excerptStyle;
  UIText.primaryButtonStyle(this.text, {super.key, this.textOverflow, this.maxLines, this.textAlign}) : style = primaryButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? 2,
    );
  }
}
