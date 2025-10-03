// Example of a page that uses the CustomNavBar
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/custom_nav_bar.dart';
import '../utils/footer.dart' show CustomFooter;
import '../utils/theme.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1024;

    final double horizontalPadding = isMobile ? 16 : (isTablet ? 24 : 40);
    final double headlineSize = isMobile ? 28 : (isTablet ? 36 : 48);
    final double subTextSize = isMobile ? 14 : (isTablet ? 16 : 18);

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      // You can also add the endDrawer here to handle mobile view
      endDrawer: Drawer(
        backgroundColor: AppColors.primaryBackground,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // The drawer items can be defined here or in a separate widget
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.secondaryBackground),
              child: Text(
                'AENS ENGINEERING',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text(
                'ABOUT US',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'SERVICES',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/services');
              },
            ),
            // ... add other drawer items
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: height),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/stand.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(color: Colors.black.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomNavBar(currentRoute: '/home'),
                        SizedBox(height: isMobile ? 16 : 24),
                        DefaultTextStyle(
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: headlineSize,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "Providing innovative \nand dependable engineering solutions...",
                                speed: const Duration(milliseconds: 80),
                              ),
                            ],
                            totalRepeatCount: 1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Engineering, Procurement, Construction, Maintenance, & Project Management Services RC 793235",
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: subTextSize,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 20 : 24,
                              vertical: isMobile ? 12 : 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/contact');
                          },
                          child: Text(
                            "WORK WITH US",
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 14 : 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: isMobile ? 16 : 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
