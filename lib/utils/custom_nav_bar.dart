import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// You might want to define these in a separate file like 'theme.dart'
// and import them to keep your code clean and organized.
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
}

// The main reusable widget
class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 900;
        final isMedium =
            constraints.maxWidth > 600 && constraints.maxWidth <= 900;
        final horizontalPadding = isWide ? 64.0 : (isMedium ? 32.0 : 16.0);
        final verticalPadding = isWide ? 48.0 : 24.0;
        final navFontSize = isWide ? 14.0 : 12.0;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AppLogo(navFontSize: navFontSize + 2),
              SizedBox(width: isWide ? 64 : 16),
              Flexible(
                child: _NavigationMenu(
                  navFontSize: navFontSize,
                  isWide: isWide,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// All other helper widgets remain the same, but are now encapsulated
// within this single file or can be moved to a separate file.
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
            'AENS ENGINNERING',
            style: AppTextStyles.appLogo(navFontSize + 2),
          ),
        ],
      ),
    );
  }
}

class _NavigationMenu extends StatelessWidget {
  final double navFontSize;
  final bool isWide;
  const _NavigationMenu({required this.navFontSize, required this.isWide});
  @override
  Widget build(BuildContext context) {
    if (!isWide) {
      return IconButton(
        icon: const Icon(Icons.menu, color: AppColors.textColor, size: 28),
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
      );
    }
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 32.0,
      runSpacing: 8.0,
      children: [
        _NavItem(
          label: 'ABOUT US',
          fontSize: navFontSize,
          onTap: () => Navigator.pushNamed(context, '/about'),
        ),
        _NavItem(
          label: 'SERVICES',
          fontSize: navFontSize,
          onTap: () => Navigator.pushNamed(context, '/services'),
        ),
        _NavItem(
          label: 'OUR PRODUCTS',
          fontSize: navFontSize,
          onTap: () => Navigator.pushNamed(context, '/works'),
        ),
        _NavItem(
          label: 'CONTACT US',
          fontSize: navFontSize,
          onTap: () => Navigator.pushNamed(context, '/contact'),
        ),
      ],
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
