import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/custom_nav_bar.dart';
import '../utils/theme.dart';
import '../utils/footer.dart' show CustomFooter;
import '../utils/app_logo.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                        const CustomNavBar(currentRoute: '/about'),
                        SizedBox(height: isWide ? 96 : 48),
                        Text(
                              'About Us',
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isWide ? 0 : 0,
                                ),
                                child: Text(
                                  'AENS Projects & Engineering Services Ltd was incorporated in 2008 to provide Engineering, Procurement, construction/Installation, Maintenance and Project Management services in the Electrical, Instrumental/Control, Mechanical and Civil Engineering disciplines. Also, Aens recruits, trains and manages personnel for our clients. We undertake projects for corporate organizations and government agencies in the energy, oil/gas, manufacturing and construction sectors.',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.bodyText(bodyFontSize),
                                ),
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

                _ProcessSection(
                  isWide: isWide,
                  isMedium: isMedium,
                  horizontalPadding: horizontalPadding,
                ),
                SizedBox(height: isWide ? 0 : 40),
                _WhyChooseUsSection(
                  isWide: isWide,
                  isMedium: isMedium,
                  horizontalPadding: horizontalPadding,
                ),
                _CertificatesSection(
                  isWide: isWide,
                  isMedium: isMedium,
                  horizontalPadding: horizontalPadding,
                ),

                _PartnershipsSection(
                  isWide: isWide,
                  isMedium: isMedium,
                  horizontalPadding: horizontalPadding,
                ),

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
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.secondaryBackground,
            ),
            child: Text(
              'AENS ENGINEERING',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'ABOUT US',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
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
          ListTile(
            title: const Text(
              'OUR PRODUCTS',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/works');
            },
          ),
          ListTile(
            title: const Text(
              'CONTACT US',
              style: TextStyle(color: Colors.white),
            ),
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

class _WhyChooseUsSection extends StatefulWidget {
  final bool isWide;
  final bool isMedium;
  final double horizontalPadding;

  const _WhyChooseUsSection({
    super.key, // Add super.key

    required this.isWide,
    required this.isMedium,
    required this.horizontalPadding,
  });

  @override
  State<_WhyChooseUsSection> createState() => _WhyChooseUsSectionState();
}

class _WhyChooseUsSectionState extends State<_WhyChooseUsSection> {
  // 1. Reintroduced the state variable to track the hovered item's index.
  int _hoveredIndex = -1;

  // Helper function to update the hovered index.
  void _onHover(int index, bool isHovering) {
    setState(() {
      _hoveredIndex = isHovering ? index : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        "title": "Multidisciplinary Expertise",
        "desc":
            "We deliver integrated solutions across electrical, mechanical, civil, and instrumentation disciplines.",
      },
      {
        "title": "Proven Track Record",
        "desc":
            "Over 15 years of executed projects across key industries, Partnerships with global OEMs (Schneider, ABB, Siemens)",
      },
      {
        "title": "Skilled Workforce",
        "desc":
            "We recruit, train, and manage certified professionals for high-performance delivery.",
      },
      {
        "title": "Commitment to Quality & Safety",
        "desc":
            "We prioritize safety, compliance, and international best practices in every project.",
      },
    ];

    final titleFontSize = widget.isWide
        ? 40.0
        : (widget.isMedium ? 32.0 : 24.0);
    final bodyFontSize = widget.isWide ? 16.0 : 14.0;

    // --- Widget Building Starts Here ---
    return Container(
      width: double.infinity,
      color: AppColors.secondaryBackground,
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
        vertical: widget.isWide ? 80 : 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "WHY CHOOSE AENS",
            style: AppTextStyles.bodyText(bodyFontSize).copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ).animate().fadeIn().slideY(begin: 0.2),
          const SizedBox(height: 12),
          Text(
            "Excellence in Every Project",
            style: AppTextStyles.pageTitle(titleFontSize),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
          const SizedBox(height: 48),

          // --- Wide Screen Layout (Wrap) ---
          widget.isWide
              ? Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: features.asMap().entries.map((entry) {
                    final index = entry.key + 1;
                    final feature = entry.value;

                    // 2. Wrap the feature container in MouseRegion and Transform
                    return MouseRegion(
                          onEnter: (_) => _onHover(index, true),
                          onExit: (_) => _onHover(index, false),
                          child: Transform.scale(
                            // Scale up when hovered
                            scale: _hoveredIndex == index ? 1.03 : 1.0,
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 300,
                              ), // Smooth animation
                              curve: Curves.easeInOut,
                              height:
                                  260, // Ensure equal card heights on wide layout and avoid overflow
                              width:
                                  (MediaQuery.of(context).size.width -
                                      widget.horizontalPadding * 2 -
                                      24) /
                                  2,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.accentColor.withOpacity(0.3),
                                  width: 1,
                                ),
                                // Add shadow on hover
                                boxShadow: _hoveredIndex == index
                                    ? [
                                        BoxShadow(
                                          color: AppColors.accentColor
                                              .withOpacity(0.2),
                                          blurRadius: 20,
                                          offset: const Offset(0, 8),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: AppColors.accentColor
                                              .withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          "0$index",
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    feature["title"]!,
                                    style: AppTextStyles.sectionTitle(
                                      bodyFontSize + 2,
                                    ).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    feature["desc"]!,
                                    style: AppTextStyles.bodyText(
                                      bodyFontSize,
                                    ).copyWith(color: AppColors.textSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: (200 * index).ms)
                        .slideY(begin: 0.2, duration: 600.ms);
                  }).toList(),
                )
              // --- Narrow Screen Layout (Column) ---
              : Column(
                  children: features.asMap().entries.map((entry) {
                    final index = entry.key + 1;
                    final feature = entry.value;

                    // Apply the same hover logic to the column layout
                    return MouseRegion(
                          onEnter: (_) => _onHover(index, true),
                          onExit: (_) => _onHover(index, false),
                          child: Transform.scale(
                            scale: _hoveredIndex == index ? 1.03 : 1.0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.accentColor.withOpacity(0.3),
                                  width: 1,
                                ),
                                boxShadow: _hoveredIndex == index
                                    ? [
                                        BoxShadow(
                                          color: AppColors.accentColor
                                              .withOpacity(0.2),
                                          blurRadius: 20,
                                          offset: const Offset(0, 8),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColors.accentColor.withOpacity(
                                        0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      "0$index",
                                      style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.accentColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    feature["title"]!,
                                    style: AppTextStyles.sectionTitle(
                                      bodyFontSize + 2,
                                    ).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    feature["desc"]!,
                                    style: AppTextStyles.bodyText(
                                      bodyFontSize,
                                    ).copyWith(color: AppColors.textSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: (200 * index).ms)
                        .slideY(begin: 0.2, duration: 600.ms);
                  }).toList(),
                ),
        ],
      ),
    );
  }
}

class _CertificatesSection extends StatefulWidget {
  final bool isWide;
  final bool isMedium;
  final double horizontalPadding;

  const _CertificatesSection({
    required this.isWide,
    required this.isMedium,
    required this.horizontalPadding,
  });

  @override
  State<_CertificatesSection> createState() => _CertificatesSectionState();
}

class _CertificatesSectionState extends State<_CertificatesSection> {
  late final ScrollController _certificatesController;
  Timer? _autoSlideTimer;
  int _hoveredTileIndex = -1;

  @override
  void initState() {
    super.initState();
    _certificatesController = ScrollController();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _certificatesController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      _animateScroll(_certificatesController);
    });
  }

  void _animateScroll(ScrollController controller) {
    if (!controller.hasClients) return;

    const double scrollAmount = 250.0;
    const Duration scrollDuration = Duration(milliseconds: 1200);

    if (controller.offset + scrollAmount >=
        controller.position.maxScrollExtent) {
      controller.animateTo(
        controller.position.minScrollExtent,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      return;
    }

    controller.animateTo(
      controller.offset + scrollAmount,
      duration: scrollDuration,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final titleFontSize = widget.isWide
        ? 40.0
        : (widget.isMedium ? 32.0 : 24.0);

    final List<Map<String, String>> certificates = List.generate(10, (index) {
      final num = index + 1;
      return {"image": "assets/images/cert$num.jpg"};
    });

    return Container(
      width: double.infinity,
      color: AppColors.primaryBackground,
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
        vertical: widget.isWide ? 80 : 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Certificates", style: AppTextStyles.pageTitle(titleFontSize))
              .animate()
              .fadeIn(duration: 800.ms, delay: 100.ms)
              .slideY(begin: 0.1),
          const SizedBox(height: 24),
          SizedBox(
            height: widget.isWide ? 300 : 200,
            child: ListView.builder(
              controller: _certificatesController,
              scrollDirection: Axis.horizontal,
              itemCount: certificates.length,
              itemBuilder: (context, index) {
                final item = certificates[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: MouseRegion(
                    onEnter: (_) {
                      if (!mounted) return;
                      setState(() => _hoveredTileIndex = index);
                    },
                    onExit: (_) {
                      if (!mounted) return;
                      setState(() => _hoveredTileIndex = -1);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      width: widget.isWide ? 280 : 180,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _hoveredTileIndex == index
                              ? AppColors.accentColor.withOpacity(0.6)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                        boxShadow: _hoveredTileIndex == index
                            ? [
                                BoxShadow(
                                  color: AppColors.accentColor.withOpacity(
                                    0.25,
                                  ),
                                  blurRadius: 18,
                                  offset: const Offset(0, 10),
                                ),
                              ]
                            : [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 10,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 180),
                          scale: _hoveredTileIndex == index ? 1.02 : 1.0,
                          curve: Curves.easeOut,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: SizedBox.expand(
                              child: Image.asset(
                                item["image"]!,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProcessSection extends StatefulWidget {
  final bool isWide;
  final bool isMedium;
  final double horizontalPadding;

  const _ProcessSection({
    required this.isWide,
    required this.isMedium,
    required this.horizontalPadding,
  });

  @override
  State<_ProcessSection> createState() => _ProcessSectionState();
}

class _ProcessSectionState extends State<_ProcessSection> {
  int _hoveredIndex = -1; // <- NEW STATE

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        "title": "Vision",
        "desc":
            "To provide excellent quality of services and products that deliver maximum value to our clients in Nigeria and around the world.",
      },
      {
        "title": "Mission",
        "desc":
            "To be one of the leading Engineering Services and Solutions providers in Africa, by providing our valued clients with dedication, cooperation, innovation, competitive pricing, highest service qualities and operational efficiencies in the Energy, Oil and Gas, manufacturing, and Construction Industries.",
      },
      {
        "title": "Values",
        "desc":
            "In AENS, we must concurrently build shareholders value while respecting the environment, addressing the concerns of our neighbours/host communities, and providing for future needs.",
      },
    ];

    final titleFontSize = widget.isWide
        ? 40.0
        : (widget.isMedium ? 32.0 : 24.0);
    final bodyFontSize = widget.isWide ? 16.0 : 14.0;

    return Container(
      width: double.infinity,
      color: AppColors.primaryBackground, // deep blue background
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
        vertical: widget.isWide ? 80 : 48,
      ),
      child: widget.isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT SIDE
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HERE'S WHAT SETS US APART",
                        style: AppTextStyles.bodyText(bodyFontSize).copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ).animate().fadeIn().slideX(
                        begin: -0.2,
                        duration: 600.ms,
                      ),
                      const SizedBox(height: 8),
                      Text(
                            "We don't just deliver projects, we deliver value.",
                            style: AppTextStyles.pageTitle(titleFontSize),
                          )
                          .animate()
                          .fadeIn(delay: 200.ms)
                          .slideX(begin: -0.2, duration: 600.ms),
                      const SizedBox(height: 16),
                      Text(
                            "At AENS, we guide each project through a proven, step-by-step process to ensure clarity, precision, and lasting results.",
                            style: AppTextStyles.bodyText(bodyFontSize),
                          )
                          .animate()
                          .fadeIn(delay: 400.ms)
                          .slideX(begin: -0.2, duration: 600.ms),
                      const SizedBox(height: 24),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/contact');
                        },
                        icon: const Icon(Icons.arrow_outward, size: 16),
                        label: Text(
                          "Get Started",
                          style: AppTextStyles.buttonText(bodyFontSize),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            32,
                            27,
                            27,
                          ),
                          foregroundColor: const Color.fromARGB(
                            255,
                            165,
                            141,
                            141,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                        ),
                      ).animate().fadeIn(delay: 600.ms),
                    ],
                  ),
                ),
                const SizedBox(width: 48),

                // RIGHT SIDE (Steps)
                Expanded(
                  flex: 1,
                  child: Column(
                    children: steps.asMap().entries.map((entry) {
                      final index = entry.key + 1;
                      final step = entry.value;

                      return MouseRegion(
                            onEnter: (_) =>
                                setState(() => _hoveredIndex = index),
                            onExit: (_) => setState(() => _hoveredIndex = -1),
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ), // smooth animation
                              curve: Curves.easeOut,
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: _hoveredIndex == index
                                      ? AppColors.accentColor
                                      : Colors.transparent,
                                  width: 1.5,
                                ),
                                boxShadow: _hoveredIndex == index
                                    ? [
                                        BoxShadow(
                                          color: AppColors.accentColor
                                              .withOpacity(0.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: AnimatedScale(
                                scale: _hoveredIndex == index ? 1.03 : 1.0,
                                duration: const Duration(milliseconds: 220),
                                curve: Curves
                                    .easeOutBack, // smoother easing with a gentle overshoot
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 14,
                                      backgroundColor: AppColors.accentColor,
                                      child: Text(
                                        "$index",
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            step["title"]!,
                                            style: AppTextStyles.sectionTitle(
                                              bodyFontSize,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            step["desc"]!,
                                            style: AppTextStyles.bodyText(
                                              bodyFontSize,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(delay: (200 * index).ms)
                          .slideY(begin: 0.2, duration: 600.ms);
                    }).toList(),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From Vision To Completion",
                  style: AppTextStyles.bodyText(bodyFontSize).copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ).animate().fadeIn().slideX(begin: -0.2),
                const SizedBox(height: 8),
                Text(
                  "Our Process to Bring Your Ideas to Life",
                  style: AppTextStyles.pageTitle(titleFontSize),
                ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2),
                const SizedBox(height: 16),
                Text(
                  "At AENS, we guide each project through a proven, step-by-step process to ensure clarity, precision, and lasting results.",
                  style: AppTextStyles.bodyText(bodyFontSize),
                ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2),
                const SizedBox(height: 24),
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  icon: const Icon(Icons.arrow_outward, size: 16),
                  label: Text(
                    "Get Started",
                    style: AppTextStyles.buttonText(bodyFontSize),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                ).animate().fadeIn(delay: 600.ms),
                const SizedBox(height: 32),

                // Mobile Steps
                Column(
                  children: steps.asMap().entries.map((entry) {
                    final index = entry.key + 1;
                    final step = entry.value;

                    return MouseRegion(
                          onEnter: (_) => setState(() => _hoveredIndex = index),
                          onExit: (_) => setState(() => _hoveredIndex = -1),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _hoveredIndex == index
                                    ? AppColors.accentColor
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: AppColors.accentColor,
                                  child: Text(
                                    "$index",
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        step["title"]!,
                                        style: AppTextStyles.sectionTitle(
                                          bodyFontSize,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        step["desc"]!,
                                        style: AppTextStyles.bodyText(
                                          bodyFontSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: (200 * index).ms)
                        .slideY(begin: 0.2, duration: 600.ms);
                  }).toList(),
                ),
              ],
            ),
    );
  }
}

class _PartnershipsSection extends StatelessWidget {
  final bool isWide;
  final bool isMedium;
  final double horizontalPadding;

  const _PartnershipsSection({
    required this.isWide,
    required this.isMedium,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final titleFontSize = isWide ? 40.0 : (isMedium ? 32.0 : 24.0);

    final partners = [
      {
        "name": "Schneider Electric",
        "logo": "assets/images/logo22.png",
        "description":
            "With over 1,700 employees, 245 factories and global presence in over 100 countries, Scheider is the undisputable leader in power management – medium voltage, low voltage and secure power and in automation systems setting standards while providing integrated efficiency solutions, combining energy, automation and software.",
      },
      {
        "name": "Siemens",
        "logo": "assets/images/logo11.png",
        "description":
            "Global powerhouse in electrification and digitalization.",
      },
      {
        "name": "ABB Group",
        "logo": "assets/images/logo33.png",
        "description":
            "Innovators in robotics, automation, and power technology.",
      },
    ];



    
    return Container(
      width: double.infinity,
      color: AppColors.secondaryBackground,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isWide ? 80 : 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
                "Our Partners",
                style: AppTextStyles.pageTitle(titleFontSize),
                textAlign: TextAlign.center,
              )
              .animate()
              .fadeIn(duration: 800.ms, delay: 100.ms)
              .slideY(begin: 0.1),

          const SizedBox(height: 24),

          LayoutBuilder(
            builder: (context, constraints) {
              final bool isWide = constraints.maxWidth > 800;
              final bool isTablet =
                  constraints.maxWidth > 600 && constraints.maxWidth <= 800;

              if (isWide) {
                // 🖥 Desktop — 3 cards per row
                return GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.05, // makes card more rectangular
                  ),
                  itemCount: partners.length,
                  itemBuilder: (context, index) {
                    final partner = partners[index];
                    return _buildPartnerCard(partner, isWide, index);
                  },
                );
              } else if (isTablet) {
                // 💻 Tablet — 2 per row
                return GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: partners.length,
                  itemBuilder: (context, index) {
                    final partner = partners[index];
                    return _buildPartnerCard(partner, isWide, index);
                  },
                );
              } else {
                // 📱 Mobile — horizontal scroll
                return SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: partners.length,
                    itemBuilder: (context, index) {
                      final partner = partners[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: _buildPartnerCard(partner, isWide, index),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPartnerCard(
    Map<String, String> partner,
    bool isWide,
    int index,
  ) {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isWide ? 250 : 200,
            height: isWide ? 280 : 240, // slightly taller for full text
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isHovered
                    ? AppColors.accentColor.withOpacity(0.8)
                    : AppColors.accentColor.withOpacity(0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: isHovered
                      ? AppColors.accentColor.withOpacity(0.4)
                      : Colors.black.withOpacity(0.2),
                  blurRadius: isHovered ? 20 : 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      partner["logo"]!,
                      height: isWide ? 70 : 55,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    partner["name"]!,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyText(isWide ? 18 : 16).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          partner["description"]!,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: AppTextStyles.bodyText(isWide ? 14 : 13)
                              .copyWith(
                                color: AppColors.textSecondary.withOpacity(
                                  0.85,
                                ),
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).animate().fadeIn(delay: (index * 200).ms).slideY(begin: 0.1);
      },
    );
  }
}
