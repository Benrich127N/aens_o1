import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

class FooterTextStyles {
  static TextStyle footerTitle(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.textColor,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
  );
  static TextStyle footerText(double fontSize) => GoogleFonts.lato(
    color: AppColors.textSecondary,
    fontSize: fontSize,
    height: 1.6,
  );
  static TextStyle footerLink(double fontSize) => GoogleFonts.lato(
    color: AppColors.textColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );
}

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth > 900;
        final bool isMedium =
            constraints.maxWidth > 600 && constraints.maxWidth <= 900;
        final double horizontalPadding = isWide
            ? 64.0
            : (isMedium ? 32.0 : 16.0);
        final double verticalPadding = isWide ? 40.0 : 24.0;
        final double titleFontSize = isWide ? 18.0 : 16.0;
        final double bodyFontSize = isWide ? 14.0 : 13.0;

        return Container(
          decoration: const BoxDecoration(
            color: AppColors.secondaryBackground,
            border: Border(top: BorderSide(color: Color(0x22FFFFFF), width: 1)),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 24,
                runSpacing: 16,
                children: [
                  SizedBox(
                    width: isWide ? 360 : 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AENS ENGINNERING',
                          style: FooterTextStyles.footerTitle(titleFontSize),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Providing innovative and dependable engineering solutions across Electrical, Instrumentation/Control, Mechanical, and Civil disciplines.',
                          style: FooterTextStyles.footerText(bodyFontSize),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Links',
                          style: FooterTextStyles.footerTitle(titleFontSize),
                        ),
                        const SizedBox(height: 8),
                        _FooterLink(
                          label: 'About Us',
                          route: '/about',
                          fontSize: bodyFontSize,
                        ),
                        _FooterLink(
                          label: 'Services',
                          route: '/services',
                          fontSize: bodyFontSize,
                        ),
                        _FooterLink(
                          label: 'Our Products',
                          route: '/works',
                          fontSize: bodyFontSize,
                        ),
                        _FooterLink(
                          label: 'Contact Us',
                          route: '/contact',
                          fontSize: bodyFontSize,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: isWide ? 320 : 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact',
                          style: FooterTextStyles.footerTitle(titleFontSize),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Plot 2, Ohaeto street, D-line Port Harcourt, Rivers State, Nigeria.',
                          style: FooterTextStyles.footerText(bodyFontSize),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Mobile: +234-703-253-8441',
                          style: FooterTextStyles.footerText(bodyFontSize),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Email: info@aensengineering.com',
                          style: FooterTextStyles.footerText(bodyFontSize),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.white.withOpacity(0.12), height: 1),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '© ${DateTime.now().year} AENS ENGINNERING. All rights reserved.',
                      style: FooterTextStyles.footerText(bodyFontSize),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final String route;
  final double fontSize;
  const _FooterLink({
    required this.label,
    required this.route,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Text(label, style: FooterTextStyles.footerLink(fontSize)),
      ),
    );
  }
}
