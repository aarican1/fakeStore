import 'package:flutter/material.dart';

TextStyle get myPriceStyle => TextStyle(
    fontSize: 12, fontWeight: FontWeight.w900, color: Colors.orange.shade700);
TextStyle get myTitleStyle => const TextStyle(
    fontSize: 15, fontWeight: FontWeight.w900, color: Colors.white60);
TextStyle get mySubtitleStyle => const TextStyle(
    fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white60);
EdgeInsetsGeometry get myPadding =>
    const EdgeInsets.only(top: 25, left: 10, right: 25);
EdgeInsetsGeometry get myMenuListViewPadding => const EdgeInsets.all(5);
TextStyle get myCategoriesStyle => TextStyle(
    fontSize: 10, fontWeight: FontWeight.w900, color: Colors.orange.shade700);
Color get myCardColor => const Color.fromARGB(255, 36, 35, 35);
Duration get myAnimatedCrossFadeDuration => const Duration(milliseconds: 50);
