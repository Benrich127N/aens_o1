import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscussPage extends StatelessWidget {
  const DiscussPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          final horizontalPadding = isWide ? 64.0 : 16.0;
          final verticalPadding = isWide ? 48.0 : 16.0;
          final navFontSize = isWide ? 14.0 : 11.0;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Colors.amber.shade200,
                                  size: navFontSize + 8,
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/home');
                                  },
                                  child: Text(
                                    'AENS ENGINNERING',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: navFontSize + 2,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 32),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _NavItem(
                                  label: 'ABOUT US',
                                  fontSize: navFontSize,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/about');
                                  },
                                ),
                                _NavItem(
                                  label: 'SERVICES',
                                  fontSize: navFontSize,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/services');
                                  },
                                ),
                                _NavItem(
                                  label: 'OUR WORKS',
                                  fontSize: navFontSize,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/works');
                                  },
                                ),
                                _NavItem(
                                  label: 'CONTACT US',
                                  fontSize: navFontSize,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/contact');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Discuss Your Project',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: isWide ? 40 : 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Let’s collaborate to bring your ideas to life. Share your vision with us, and we’ll work together to create a space that exceeds your expectations.',
                        style: GoogleFonts.montserrat(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: isWide ? 16 : 13,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/contact');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'CONTACT US',
                              style: GoogleFonts.montserrat(
                                fontSize: navFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward,
                              size: navFontSize + 2,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final double fontSize;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    this.fontSize = 16,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
