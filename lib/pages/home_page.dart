import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/theme.dart';
import '../utils/footer.dart' show CustomFooter;

// Theme Definition (AppColors & AppTextStyles)
// Use centralized AppColors/AppTextStyles from theme.dart

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          final isSmall = constraints.maxWidth <= 600;
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
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/chair.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.secondaryBackground,
                              child: const Center(
                                child: Text(
                                  'Image not found',
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          color: AppColors.primaryBackground.withOpacity(0.55),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: isWide ? 96 : 48),
                            Text(
                                  'AENS ENGINEERING',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.pageTitle(titleFontSize),
                                )
                                .animate()
                                .fadeIn(duration: 800.ms, delay: 200.ms)
                                .slideY(begin: 0.1, end: 0, duration: 800.ms),
                            SizedBox(height: isWide ? 40 : 28),
                            Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 4.0,
                                  children: [
                                    Text(
                                      'DRIVEN BY (',
                                      style: AppTextStyles.bodyText(
                                        bodyFontSize,
                                      ),
                                    ),
                                    Text(
                                      'PROFICIENCY',
                                      style:
                                          AppTextStyles.bodyText(
                                            bodyFontSize,
                                          ).copyWith(
                                            color: AppColors.accentColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      ')    DEFINED BY (',
                                      style: AppTextStyles.bodyText(
                                        bodyFontSize,
                                      ),
                                    ),
                                    Text(
                                      'RESULTS',
                                      style:
                                          AppTextStyles.bodyText(
                                            bodyFontSize,
                                          ).copyWith(
                                            color: AppColors.accentColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      ')',
                                      style: AppTextStyles.bodyText(
                                        bodyFontSize,
                                      ),
                                    ),
                                  ],
                                )
                                .animate()
                                .fadeIn(duration: 800.ms, delay: 300.ms)
                                .slideY(begin: 0.1, end: 0, duration: 800.ms),
                            SizedBox(height: isWide ? 56 : 36),
                            // _DiscussButton(
                            //   context: context,
                            //   buttonFontSize: buttonFontSize,
                            // ).animate().fadeIn(duration: 800.ms, delay: 400.ms),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: AppColors.secondaryBackground,
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? 64.0 : (isMedium ? 32.0 : 16.0),
                    vertical: isWide ? 48.0 : 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                            'Our Company',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.sectionTitle(
                              isWide ? 40.0 : (isMedium ? 30.0 : 24.0),
                            ),
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
                              'At TailoredSpace, we transcend the conventional boundaries of architecture and transform dreams into tangible realities. Our unwavering commitment to innovation, creativity, and precision makes us more than just architects; we are the creators of experiences, emotions, and aspirations.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodyText(bodyFontSize),
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
                    ],
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

class _NavItem extends StatefulWidget {
  final String label;
  final double fontSize;
  final VoidCallback onTap;
  final bool isActive;

  const _NavItem({
    required this.label,
    this.fontSize = 16,
    required this.onTap,
    this.isActive = false,
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
