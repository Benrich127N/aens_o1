import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/custom_nav_bar.dart';

class AppColors {
  static const Color primaryBackground = Color(0xFF121212);
  static const Color secondaryBackground = Color(0xFF1C1C1C);
  static const Color accentColor = Color(0xFFBC914C);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA0A0A0);
}

class AppTextStyles {
  static TextStyle navBar(double fontSize) => GoogleFonts.lato(
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
    fontSize: fontSize,
  );
  static TextStyle appLogo(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
    letterSpacing: 1.2,
  );
  static TextStyle pageTitle(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.textColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );
  static TextStyle sectionTitle(double fontSize) => GoogleFonts.montserrat(
    color: AppColors.textColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );
  static TextStyle bodyText(double fontSize) => GoogleFonts.lato(
    color: AppColors.textSecondary,
    fontSize: fontSize,
    height: 1.7,
  );
  static TextStyle bulletPoint(double fontSize) => GoogleFonts.lato(
    color: AppColors.textSecondary,
    fontSize: fontSize,
    height: 1.8,
  );
  static TextStyle buttonText(double fontSize) => GoogleFonts.lato(
    color: AppColors.textColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );
}

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
          final verticalPadding = isWide ? 48.0 : 24.0;
          final navFontSize = isWide ? 14.0 : 12.0;
          final titleFontSize = isWide ? 64.0 : (isMedium ? 48.0 : 32.0);
          final bodyFontSize = isWide ? 17.0 : (isMedium ? 15.0 : 14.0);
          final buttonFontSize = isWide ? 16.0 : 14.0;

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomNavBar(),

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
                      constraints: BoxConstraints(maxWidth: isWide ? 800 : 600),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWide ? 0 : horizontalPadding,
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
                _DiscussButton(
                  context: context,
                  buttonFontSize: buttonFontSize,
                ).animate().fadeIn(duration: 800.ms, delay: 400.ms),

                SizedBox(height: isWide ? 80 : 40),

                _ProcessSection(
                  isWide: isWide,
                  isMedium: isMedium,
                  horizontalPadding: horizontalPadding,
                ),
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
            Icons.home_max_outlined,
            color: AppColors.accentColor,
            size: navFontSize + 8,
          ),
          const SizedBox(width: 8),
          Text(
            'AENS ENGINNERING',
            style: AppTextStyles.appLogo(navFontSize + 2),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final double fontSize;
  final VoidCallback onTap;
  const _NavItem({
    required this.label,
    this.fontSize = 16,
    required this.onTap,
  });
  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<Color?> _colorAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _widthAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _colorAnimation = ColorTween(
      begin: AppColors.textColor,
      end: AppColors.accentColor,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    setState(() => _isHovering = true);
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    setState(() => _isHovering = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return Text(
                  widget.label,
                  style: AppTextStyles.navBar(widget.fontSize).copyWith(
                    color: _colorAnimation.value,
                    decoration: TextDecoration.none,
                  ),
                );
              },
            ),
            SizedBox(
              height: 4,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizeTransition(
                  sizeFactor: _widthAnimation,
                  axis: Axis.horizontal,
                  child: Container(
                    height: 2,
                    width: widget.fontSize * widget.label.length * 0.7,
                    color: AppColors.accentColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscussButton extends StatefulWidget {
  final BuildContext context;
  final double buttonFontSize;
  const _DiscussButton({required this.context, required this.buttonFontSize});
  @override
  State<_DiscussButton> createState() => _DiscussButtonState();
}

class _DiscussButtonState extends State<_DiscussButton>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<double> _arrowSlideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.03,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _backgroundColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: AppColors.accentColor.withOpacity(0.1),
    ).animate(_controller);
    _arrowSlideAnimation = Tween<double>(
      begin: 0,
      end: 4,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    setState(() => _isHovering = true);
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    setState(() => _isHovering = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedBuilder(
          animation: _backgroundColorAnimation,
          builder: (context, child) {
            return TextButton(
              onPressed: () {
                Navigator.pushNamed(widget.context, '/discuss');
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textColor,
                backgroundColor: _backgroundColorAnimation.value,
                side: const BorderSide(color: AppColors.textColor, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'DISCUSS A PROJECT',
                    style: AppTextStyles.buttonText(widget.buttonFontSize),
                  ),
                  AnimatedBuilder(
                    animation: _arrowSlideAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_arrowSlideAnimation.value, 0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: widget.buttonFontSize + 4,
                          color: AppColors.accentColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
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

class _ProcessSection extends StatelessWidget {
  final bool isWide;
  final bool isMedium;
  final double horizontalPadding;

  const _ProcessSection({
    required this.isWide,
    required this.isMedium,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        "title": "Discovery & Consultation",
        "desc":
            "We start by understanding your goals and analyzing project needs to define the right direction.",
      },
      {
        "title": "Design & Innovation",
        "desc":
            "Ideas are transformed into detailed engineering plans that blend creativity with practical solutions.",
      },
      {
        "title": "Detailed Engineering",
        "desc":
            "Using advanced tools and certified expertise, we create accurate drawings and models.",
      },
      {
        "title": "Permitting & Approvals",
        "desc":
            "We handle the preparation and submission of all necessary documentation to ensure smooth approvals.",
      },
    ];

    final titleFontSize = isWide ? 40.0 : (isMedium ? 32.0 : 24.0);
    final bodyFontSize = isWide ? 16.0 : 14.0;

    return Container(
      width: double.infinity,

      color: AppColors.primaryBackground, // deep blue background
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isWide ? 80 : 48,
      ),
      child: isWide
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
                        "From Vision To Completion",
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
                            "Our Process to Bring Your Ideas to Life",
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
                      return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: index == 1
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

                Column(
                  children: steps.asMap().entries.map((entry) {
                    final index = entry.key + 1;
                    final step = entry.value;
                    return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 156, 48, 48),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: index == 1
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
