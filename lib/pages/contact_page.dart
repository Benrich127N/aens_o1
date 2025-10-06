import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/contact_map.dart';
import '../utils/custom_nav_bar.dart';
import '../utils/theme.dart';
import '../utils/footer.dart' show CustomFooter;
import '../utils/app_logo.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      endDrawer: Builder(
        builder: (drawerContext) =>
            isSmallScreen(MediaQuery.of(drawerContext).size.width)
            ? _buildMobileDrawer(drawerContext)
            : const SizedBox.shrink(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          final isMedium =
              constraints.maxWidth > 600 && constraints.maxWidth <= 900;
          final horizontalPadding = isWide ? 64.0 : (isMedium ? 32.0 : 16.0);
          final titleFontSize = isWide ? 64.0 : (isMedium ? 48.0 : 32.0);
          final bodyFontSize = isWide ? 17.0 : (isMedium ? 15.0 : 14.0);

          final viewportHeight = MediaQuery.of(context).size.height;
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: viewportHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomNavBar(currentRoute: '/contact'),
                        SizedBox(height: isWide ? 96 : 48),
                        Text(
                              'Contact Us',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.pageTitle(titleFontSize),
                            )
                            .animate()
                            .fadeIn(duration: 800.ms, delay: 200.ms)
                            .slideY(begin: 0.1, end: 0, duration: 800.ms),
                        SizedBox(height: isWide ? 40 : 28),
                        ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isWide ? 800 : 600,
                              ),
                              child: Text(
                                'Get in touch with AENS ENGINEERING Address Plot 2, Ohaeto street, D-line Port Harcourt, Rivers state, Nigeria (By Obito street, off Aba road, between Eastern Garden Chinese Restaurant and CFC Bus-stop). Mobile +234-703-253-8441',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodyText(bodyFontSize),
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 800.ms, delay: 300.ms)
                            .slideY(begin: 0.1, end: 0, duration: 800.ms),
                        SizedBox(height: isWide ? 56 : 36),
                      ],
                    ),
                  ),
                ),

                // _DiscussButton(
                //   context: context,
                //   buttonFontSize: buttonFontSize,
                // ).animate().fadeIn(duration: 800.ms, delay: 400.ms),
                SizedBox(height: isWide ? 80 : 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Flex(
                    direction: isWide ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Left - Contact Details
                      Flexible(
                        fit: isWide ? FlexFit.tight : FlexFit.loose,
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Contact Details",
                                style: AppTextStyles.sectionTitle(20),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    color: AppColors.accentColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "NEED HELP? TALK TO AN EXPERT :\n	+234-703-253-8441",
                                      style: AppTextStyles.bodyText(14),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email,
                                    color: AppColors.accentColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "EMAIL :\ninfo@aensengineering.com",
                                      style: AppTextStyles.bodyText(14),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.accentColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "Plot 2, Ohaeto street, D-line Port Harcourt, Rivers state, Nigeria (By Obito street, off Aba road, between Eastern Garden Chinese Restaurant and CFC Bus-stop).",
                                      style: AppTextStyles.bodyText(14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: isWide ? 24 : 0, height: isWide ? 0 : 24),

                      // Right - Send Message Form
                      Flexible(
                        fit: isWide ? FlexFit.tight : FlexFit.loose,
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SEND A MESSAGE",
                              style: AppTextStyles.sectionTitle(22),
                            ),
                            const SizedBox(height: 20),

                            TextField(
                              decoration: InputDecoration(
                                labelText: "Company Name*",
                                labelStyle: AppTextStyles.bodyText(14),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),

                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: "Email Id*",
                                      labelStyle: AppTextStyles.bodyText(14),
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: "Contact*",
                                      labelStyle: AppTextStyles.bodyText(14),
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),

                            TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                labelText: "Message",
                                labelStyle: AppTextStyles.bodyText(14),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accentColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                              ),
                              onPressed: () {
                                // Handle submit
                              },
                              child: Text(
                                "Submit Now →",
                                style: AppTextStyles.buttonText(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isWide ? 80 : 40),

                // Fixed Map Section
                // Fixed Map Section
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // rounded corners
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 900, // reduces how wide it stretches
                      ),
                      child: SizedBox(
                        height: isWide ? 420 : 260,
                        child: const ContactMap(),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: isWide ? 80 : 40),
                const CustomFooter(),
              ],
            ),
          );
        },
      ),
    );
  }

  bool isSmallScreen(double width) => width <= 600;

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryBackground,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.secondaryBackground,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const AppLogo(fontSize: 18.0),
            ),
          ),
          _DrawerNavItem(
            label: 'ABOUT US',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
          _DrawerNavItem(
            label: 'SERVICES',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/services');
            },
          ),
          _DrawerNavItem(
            label: 'OUR WORKS',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/works');
            },
          ),
          _DrawerNavItem(
            label: 'CONTACT US',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
          ),
        ],
      ),
    );
  }
}

// Reusable Widgets
// Removed duplicated _AppLogo; using shared AppLogo instead

class _DrawerNavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DrawerNavItem({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: AppTextStyles.navBar(
          16.0,
        ).copyWith(color: AppColors.textColor, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
      hoverColor: AppColors.secondaryBackground,
    );
  }
}
