import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  final double fontSize;

  const AppLogo({super.key, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // ✅ prevents forcing full width
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logomain.png', // replace with your actual image path
          height: fontSize + 6,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 8),
        Flexible(
          // ✅ ensures long text wraps or scales properly
          child: Text(
            'AENS ENGINEERING',
            overflow: TextOverflow.ellipsis, // ✅ no overflow
            style: GoogleFonts.montserrat(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
              color: Colors.black.withOpacity(0.76),
            ),
          ),
        ),
      ],
    );
  }
}
