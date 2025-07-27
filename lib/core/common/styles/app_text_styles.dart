import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ps_shakib/core/utils/constants/app_sizer.dart';

class AppTextStyles {
  AppTextStyles._();

  static final TextStyle headline1 = GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final TextStyle headline2 = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static final TextStyle headline3 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  // Body text
  static final TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static final TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  static final TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
  );

  // Buttons
  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Captions or footnotes
  static final TextStyle caption = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  // Error text
  static final TextStyle error = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );
}
