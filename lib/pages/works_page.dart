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
                      constraints: BoxConstraints(maxWidth: isWide ? 800 : 600),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWide ? 0 : horizontalPadding,
                        ),
                        child: Text(
                          'Delivering World-Class Electrical & Instrumentation Solutions At AENS, we offer a premium selection of Electrical and Instrumentation / Control devices from industry-leading brands including Schneider Electric, ABB, and Siemens.We are a trusted stockist and solutions provider, delivering products that ensure safety, performance, and reliability across industrial and commercial sectors.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyText(bodyFontSize),
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 800.ms, delay: 300.ms)
                    .slideY(begin: 0.1, end: 0, duration: 800.ms),
                SizedBox(height: isWide ? 56 : 36),

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
class _ProjectSection extends StatelessWidget {
  final bool isWide;
  final bool isMedium;
  final double horizontalPadding;

  const _ProjectSection({
    required this.isWide,
    required this.isMedium,
    required this.horizontalPadding,
  });

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
      // ... continue until all 18 Siemens products
    ];

    Widget buildProductSection(
      String title,
      List<Map<String, String>> projects,
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(title, style: AppTextStyles.sectionTitle(isWide ? 28 : 22)),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isWide ? 4 : (isMedium ? 2 : 1),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      project["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 12,
                    child: Text(
                      project["title"]!,
                      style: AppTextStyles.sectionTitle(14),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      );
    }

    final titleFontSize = isWide ? 40.0 : (isMedium ? 32.0 : 24.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text("Our Products", style: AppTextStyles.pageTitle(titleFontSize)),
          const SizedBox(height: 24),

          // Schneider Section
          buildProductSection("Schneider Electric", schneiderProjects),

          // ABB Section
          buildProductSection("ABB", abbProjects),

          // SIEMENS Section
          buildProductSection("SIEMENS", siemensProjects),
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
