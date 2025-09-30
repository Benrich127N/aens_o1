import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryBackground = Color(0xFF121212);
  static const Color secondaryBackground = Color(0xFF1C1C1C);
  static const Color accentColor = Color(0xFFBC914C);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA0A0A0);
}

class AppTextStyles {
  static TextStyle navBar(double fontSize) => GoogleFonts.lato(
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontSize: fontSize,
  );

  static TextStyle appLogo(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
    letterSpacing: 1.2,
  );

  static TextStyle pageTitle(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.textColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle sectionTitle(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.textColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyText(double fontSize) => GoogleFonts.lato(
    color: AppColors.textSecondary,
    fontSize: fontSize,
    height: 1.7,
  );

  static TextStyle bulletPoint(double fontSize) => GoogleFonts.lato(
    color: AppColors.textSecondary,
    fontSize: fontSize,
    height: 1.8,
  );

  static TextStyle buttonText(double fontSize) => GoogleFonts.lato(
    color: AppColors.textColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );
}
