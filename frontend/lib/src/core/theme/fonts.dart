import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';

TextStyle get labelStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 16.s3, fontWeight: FontWeight.w400, decoration: TextDecoration.none);

TextStyle get categoryLabelStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 17.s3, fontWeight: FontWeight.w600, color: colorLabelOnPrimary, decoration: TextDecoration.none);
TextStyle get quantityTitlesLabelStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 12.s3, fontWeight: FontWeight.w600, color: colorLabelOnPrimary, decoration: TextDecoration.none);

TextStyle get contentTitleStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 15.s3, fontWeight: FontWeight.w600, color: colorLabelOnPrimary, decoration: TextDecoration.none);
TextStyle get releaseDateStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 12.s3, fontWeight: FontWeight.w400, color: colorHint, decoration: TextDecoration.none);

TextStyle get excerptStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 14.s3, fontWeight: FontWeight.w400, color: colorHint, decoration: TextDecoration.none);
TextStyle get primaryButtonStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 16.s3, fontWeight: FontWeight.bold, color: colorLabelOnPrimary, decoration: TextDecoration.none);

TextStyle get labelTextFieldStyle => TextStyle(fontFamily: 'Axiforma', fontSize: 14.s3, fontWeight: FontWeight.w400, decoration: TextDecoration.none);