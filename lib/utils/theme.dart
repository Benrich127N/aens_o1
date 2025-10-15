import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryBackground = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryBackground = Color(0xFF1C1C1C);
  static const Color accentColor = Color(0xFFBC914C);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA0A0A0);
  static const Color whitetextColor = Color(0xFFFFFFFF);
  static const Color blacktextColor = Color.fromARGB(193, 0, 0, 0);
}

class AppTextStyles {
  static TextStyle navBar(double fontSize) => GoogleFonts.lato(
    color: const Color.fromARGB(30, 117, 115, 115),
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
    letterSpacing: 0.6,
  );

  static TextStyle appLogo(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.blacktextColor,
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
    letterSpacing: 1.4,
  );

  static TextStyle pageTitle(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.blacktextColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
  );

  static TextStyle sectionTitle(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.blacktextColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.1,
  );
  static TextStyle sectionTitleWhite(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.blacktextColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.1,
  );

  static TextStyle sectionTitleBlack(double fontSize) => GoogleFonts.montserrat(
    color: const Color.fromARGB(255, 23, 17, 17),
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.1,
  );

  static TextStyle bodyText(double fontSize) => GoogleFonts.lato(
    color: AppColors.blacktextColor,
    fontSize: fontSize,
    height: 1.8,
    letterSpacing: 0.2,
  );

  static TextStyle bulletPoint(double fontSize) => GoogleFonts.lato(
    color: AppColors.textSecondary,
    fontSize: fontSize,
    height: 1.85,
    letterSpacing: 0.15,
  );

  static TextStyle buttonText(double fontSize) => GoogleFonts.lato(
    color: AppColors.textColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
  );
}
