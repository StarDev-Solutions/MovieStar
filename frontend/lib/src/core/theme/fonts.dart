import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

TextStyle get labelStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 18, fontWeight: FontWeight.w400, decoration: TextDecoration.none);

TextStyle get categoryLabelStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 17, fontWeight: FontWeight.w600, color: colorLabelOnPrimary, decoration: TextDecoration.none);
TextStyle get quantityTitlesLabelStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 12, fontWeight: FontWeight.w600, color: colorLabelOnPrimary, decoration: TextDecoration.none);

TextStyle get contentTitleStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 15, fontWeight: FontWeight.w600, color: colorLabelOnPrimary, decoration: TextDecoration.none);
TextStyle get releaseDateStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 12, fontWeight: FontWeight.w400, color: hintColor, decoration: TextDecoration.none);

TextStyle get excerptStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 14, fontWeight: FontWeight.w400, color: hintColor, decoration: TextDecoration.none);