import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallet_ui/src/colors/colors.dart';

/// Project Text Styles
abstract class GWTextStyle {
  /// bold 36
  static final TextStyle bold36 = _baseTextStyle.copyWith(
    fontSize: 36,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.bold,
    fontFamily: 'DMSans',
  );

  /// AnonymousPro bold 32
  static final TextStyle boldA32 = _baseTextStyle.copyWith(
    fontSize: 32,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.bold,
    fontFamily: 'AnonymousPro',
  );

  /// bold 24
  static final TextStyle bold24 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.bold,
    fontFamily: 'DMSans',
  );

  /// bold 20
  static final TextStyle bold20 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.bold,
    fontFamily: 'DMSans',
  );

  /// regular 20
  static final TextStyle regular20 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.regular,
    fontFamily: 'DMSans',
  );

  /// medium 16
  static final TextStyle medium16 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.medium,
    fontFamily: 'DMSans',
  );

  /// bold 14
  static final TextStyle bold14 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.bold,
    fontFamily: 'DMSans',
  );

  /// medium 14
  static final TextStyle medium14 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.medium,
    fontFamily: 'DMSans',
  );

  /// regular 14
  static final TextStyle regular14 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.regular,
    fontFamily: 'DMSans',
  );

  /// regular 12
  static final TextStyle regular12 = _baseTextStyle.copyWith(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.regular,
    fontFamily: 'DMSans',
  );

  /// regular 10
  static final TextStyle regular10 = _baseTextStyle.copyWith(
    fontSize: 10,
    fontStyle: FontStyle.normal,
    fontWeight: GWFontWeight.regular,
    fontFamily: 'DMSans',
  );

  static final _baseTextStyle = TextStyle(
    color: GWColors.black,
    fontWeight: GWFontWeight.regular,
    fontFeatures: [
      FontFeature.stylisticSet(1),
      const FontFeature.slashedZero(),
      const FontFeature.enable('ordn'),
      const FontFeature.enable('cv05'),
      const FontFeature.enable('case'),
    ],
  );
}

/// Namespace for Default Font Weights
abstract class GWFontWeight {
  /// FontWeight value of `w900`
  static const FontWeight black = FontWeight.w900;

  /// FontWeight value of `w800`
  static const FontWeight extraBold = FontWeight.w800;

  /// FontWeight value of `w700`
  static const FontWeight bold = FontWeight.w700;

  /// FontWeight value of `w600`
  static const FontWeight semiBold = FontWeight.w600;

  /// FontWeight value of `w500`
  static const FontWeight medium = FontWeight.w500;

  /// FontWeight value of `w400`
  static const FontWeight regular = FontWeight.w400;

  /// FontWeight value of `w300`
  static const FontWeight light = FontWeight.w300;

  /// FontWeight value of `w200`
  static const FontWeight extraLight = FontWeight.w200;

  /// FontWeight value of `w100`
  static const FontWeight thin = FontWeight.w100;
}
