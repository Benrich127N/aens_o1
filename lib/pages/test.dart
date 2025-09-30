// Example of a page that uses the CustomNavBar
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/custom_nav_bar.dart';
import '../utils/footer.dart' show CustomFooter;
import '../utils/theme.dart';
import 'shuffle_text.dart'; // Adjust the import path as needed

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
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
            Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/stand.jpg", // replace with your image
                    fit: BoxFit.cover,
                  ),
                ),

                // Dark overlay
                Positioned.fill(
                  child: Container(color: Colors.black.withOpacity(0.5)),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomNavBar(currentRoute: '/test'),

                        // Headline text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShuffleText(
                              text:
                                  "Providing innovative \n and dependable engineering solutions...",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                              duration: const Duration(
                                seconds: 3,
                              ), // one cycle length
                              pause: const Duration(
                                milliseconds: 700,
                              ), // pause before repeating
                              repeat: true, // loop forever
                            ),
                            // Text(
                            //   "WE DESIGN\nFOR YOUR SPACE",
                            //   style: GoogleFonts.lato(
                            //     color: Colors.white,
                            //     fontSize: 42,
                            //     fontWeight: FontWeight.bold,
                            //     height: 1.2,
                            //   ),
                            // ),
                            const SizedBox(height: 16),
                            Text(
                              "Engineering, Procurement, Construction, Maintenance, & Project Management Services RC 793235",
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "VIEW PORTFOLIO",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
