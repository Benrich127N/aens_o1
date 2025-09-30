import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

// Now accepts currentRoute
class CustomNavBar extends StatelessWidget {
  final String currentRoute;
  const CustomNavBar({super.key, required this.currentRoute});

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
                  currentRoute: currentRoute, // pass it down
                ),
              ),
            ],
          ),
        );
      },
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

class _NavigationMenu extends StatelessWidget {
  final double navFontSize;
  final bool isWide;
  final String currentRoute;
  const _NavigationMenu({
    required this.navFontSize,
    required this.isWide,
    required this.currentRoute,
  });
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
          isActive: currentRoute == '/about',
          onTap: () => Navigator.pushNamed(context, '/about'),
        ),
        _NavItem(
          label: 'SERVICES',
          fontSize: navFontSize,
          isActive: currentRoute == '/services',
          onTap: () => Navigator.pushNamed(context, '/services'),
        ),
        _NavItem(
          label: 'OUR PRODUCTS',
          fontSize: navFontSize,
          isActive: currentRoute == '/works',
          onTap: () => Navigator.pushNamed(context, '/works'),
        ),
        _NavItem(
          label: 'CONTACT US',
          fontSize: navFontSize,
          isActive: currentRoute == '/contact',
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

    // if item is active make it show highlighted state initially
    if (widget.isActive) {
      _controller.value = 1.0;
    }
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
    // do not reverse if the item is active so underline stays visible when not hovered
    if (!widget.isActive) _controller.reverse();
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
                final isGlowing = widget.isActive || _isHovering;
                return Text(
                  widget.label,
                  style: AppTextStyles.navBar(widget.fontSize).copyWith(
                    color: widget.isActive
                        ? AppColors.accentColor
                        : _colorAnimation.value,
                    decoration: TextDecoration.none,
                    shadows: isGlowing
                        ? [
                            Shadow(
                              color: AppColors.accentColor.withOpacity(0.85),
                              blurRadius: 12,
                              offset: Offset(0, 0),
                            ),
                          ]
                        : null,
                  ),
                );
              },
            ),
            SizedBox(
              height: 6,
              child: Align(
                alignment: Alignment.centerLeft,
                child: widget.isActive
                    ? Container(
                        height: 3,
                        width: widget.fontSize * widget.label.length * 0.7,
                        color: AppColors.accentColor,
                      )
                    : SizeTransition(
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
