import 'package:flutter/material.dart';

import 'theme.dart';

class AppLogo extends StatelessWidget {
  final double fontSize;
  final String assetPath;
  final String brandText;
  final double spacing;

  const AppLogo({
    super.key,
    required this.fontSize,
    this.assetPath = 'assets/images/logomain.png',
    this.brandText = 'AENS ENGINEERING',
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final double imageHeight = fontSize + 8;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/home');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Prefer image logo; gracefully fallback if missing
          Image.asset(
            assetPath,
            height: imageHeight,
            filterQuality: FilterQuality.high,
            errorBuilder: (context, _, __) {
              return Icon(
                Icons.architecture_outlined,
                color: AppColors.accentColor,
                size: imageHeight,
              );
            },
          ),
          SizedBox(width: spacing),
          Text(brandText, style: AppTextStyles.appLogo(fontSize + 2)),
        ],
      ),
    );
  }
}
