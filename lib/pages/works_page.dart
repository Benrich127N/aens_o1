import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/custom_nav_bar.dart';
import '../utils/footer.dart' show CustomFooter;
import '../utils/theme.dart';

// Use centralized AppColors/AppTextStyles from theme.dart

class WorksPage extends StatelessWidget {
  const WorksPage({super.key});

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
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: viewportHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      children: [
                        const CustomNavBar(currentRoute: '/works'),
                        SizedBox(height: isWide ? 96 : 48),
                        Text(
                              'Our Products',
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
                                'Delivering World-Class Electrical & Instrumentation Solutions At AENS, we offer a premium selection of Electrical and Instrumentation / Control devices from industry-leading brands including Schneider Electric, ABB, and Siemens.We are a trusted stockist and solutions provider, delivering products that ensure safety, performance, and reliability across industrial and commercial sectors.',
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

                // After _DiscussButton and SizedBox
                _ProjectSection(
                  isWide: isWide,
                  isMedium: isMedium,
                  horizontalPadding: horizontalPadding,
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
              child: _AppLogo(navFontSize: 18.0),
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
class _ProjectSection extends StatefulWidget {
  final bool isWide;
  final bool isMedium;
  final double horizontalPadding;

  const _ProjectSection({
    super.key, // ADD super.key

    required this.isWide,
    required this.isMedium,
    required this.horizontalPadding,
  });

  @override
  State<_ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<_ProjectSection> {
  late ScrollController _schneiderController;
  late ScrollController _abbController;
  late ScrollController _siemensController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _schneiderController = ScrollController();
    _abbController = ScrollController();
    _siemensController = ScrollController();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _schneiderController.dispose();
    _abbController.dispose();
    _siemensController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      _animateScroll(_schneiderController);
      _animateScroll(_abbController);
      _animateScroll(_siemensController);
    });
  }

  void _animateScroll(ScrollController controller) {
    if (!controller.hasClients) return;

    const double scrollAmount = 250.0; // Distance to scroll
    const Duration scrollDuration = Duration(milliseconds: 1200);

    double nextOffset;
    if (controller.offset + scrollAmount >=
        controller.position.maxScrollExtent) {
      // Reached the end, jump back to start smoothly
      nextOffset = controller.position.minScrollExtent;
      controller.animateTo(
        nextOffset,
        duration: const Duration(
          milliseconds: 800,
        ), // Slightly faster jump back
        curve: Curves.easeInOut,
      );
    } else {
      // Scroll forward
      nextOffset = controller.offset + scrollAmount;
      controller.animateTo(
        nextOffset,
        duration: scrollDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Schneider Electric products
    final schneiderProjects = [
      {
        "title": "Schneider Product 1",
        "subtitle": "",
        "image": "assets/images/Schneider1.jpeg",
      },
      {
        "title": "Schneider Product 2",
        "subtitle": "",
        "image": "assets/images/Schneider2.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider3.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider10.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider8.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider11.jpeg",
      },
      // ... continue until all 18 Schneider products
    ];

    // ABB products
    final abbProjects = [
      {
        "title": "ABB Product 1",
        "subtitle": "",
        "image": "assets/images/Schneider4.jpeg",
      },
      {
        "title": "ABB Product 2",
        "subtitle": "",
        "image": "assets/images/Schneider5.jpeg",
      },
      {
        "title": "ABB Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider6.jpg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider11.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider3.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider10.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider8.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider11.jpeg",
      },
      // ... continue until all 18 ABB products
    ];

    // Siemens products
    final siemensProjects = [
      {
        "title": "Siemens Product 1",
        "subtitle": "",
        "image": "assets/images/Schneider7.jpg",
      },
      {
        "title": "Siemens Product 2",
        "subtitle": "",
        "image": "assets/images/Schneider8.jpeg",
      },
      {
        "title": "Siemens Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider9.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider12.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider3.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider10.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider8.jpeg",
      },
      {
        "title": "Schneider Product 3",
        "subtitle": "",
        "image": "assets/images/Schneider11.jpeg",
      },
      // ... continue until all 18 Siemens products
    ];
    Widget buildProductSection(
      String title,
      List<Map<String, String>> projects,
      ScrollController controller, // ADD this new parameter
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            title,
            style: AppTextStyles.sectionTitle(widget.isWide ? 28 : 22),
          ), // Use widget.isWide
          const SizedBox(height: 16),
          SizedBox(
            // Set a fixed height for the horizontal slider row
            height: widget.isWide ? 300 : 200, // Use widget.isWide
            child: ListView.builder(
              controller: controller, // ADD controller here
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                  ), // Spacing between images
                  child: SizedBox(
                    width: widget.isWide ? 280 : 180, // Use widget.isWide
                    child: Stack(
                      children: [
                        // ... rest of the Stack content is unchanged
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            project["image"]!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        // Optional: Overlay for gradient/title (if needed in a horizontal view)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        // Optional: Add product title overlay here
                        // Example:
                        /*
            Positioned(
             bottom: 8,
             left: 8,
             child: Text(
              project["title"]!,
              style: AppTextStyles.bodyText(14).copyWith(color: Colors.white),
             ),
            )
            */
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }

    final titleFontSize = widget.isWide
        ? 40.0
        : (widget.isMedium ? 32.0 : 24.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text("Our Products", style: AppTextStyles.pageTitle(titleFontSize)),
          const SizedBox(height: 24),

          // Schneider Section
          buildProductSection(
            "Schneider Electric",
            schneiderProjects,
            _schneiderController,
          ),

          // ABB Section
          buildProductSection("ABB", abbProjects, _abbController),

          // SIEMENS Section
          buildProductSection("SIEMENS", siemensProjects, _siemensController),
        ],
      ),
    );
  }
}

class _AppLogo extends StatelessWidget {
  final double navFontSize;
  const _AppLogo({required this.navFontSize});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/home');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.architecture_outlined,
            color: AppColors.accentColor,
            size: navFontSize + 8,
          ),
          const SizedBox(width: 8),
          Text(
            'AENS ENGINEERING',
            style: AppTextStyles.appLogo(navFontSize + 2),
          ),
        ],
      ),
    );
  }
}

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
