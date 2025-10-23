import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';
import 'app_logo.dart';

class CustomNavBar extends StatefulWidget {
  final String currentRoute;
  const CustomNavBar({super.key, required this.currentRoute});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  bool _isMenuOpen = false; // controls the mobile dropdown menu

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: logo + hamburger
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/'),
                      child: const AppLogo(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(
                        _isMenuOpen ? Icons.close : Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: () =>
                          setState(() => _isMenuOpen = !_isMenuOpen),
                    ),
                  ],
                ),

                // Collapsible menu for mobile
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      _NavItem(
                        label: 'ABOUT US',
                        route: '/about',
                        currentRoute: widget.currentRoute,
                        isMobile: true,
                        onTap: _closeMenu,
                      ),
                      _NavItem(
                        label: 'SERVICES',
                        route: '/services',
                        currentRoute: widget.currentRoute,
                        isMobile: true,
                        onTap: _closeMenu,
                      ),
                      _NavItem(
                        label: 'OUR PRODUCTS',
                        route: '/works',
                        currentRoute: widget.currentRoute,
                        isMobile: true,
                        onTap: _closeMenu,
                      ),
                      _NavItem(
                        label: 'CONTACT US',
                        route: '/contact',
                        currentRoute: widget.currentRoute,
                        isMobile: true,
                        onTap: _closeMenu,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                  crossFadeState: _isMenuOpen
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/'),
                  child: const AppLogo(fontSize: 18),
                ),
                Row(
                  children: [
                    _NavItem(
                      label: 'ABOUT US',
                      route: '/about',
                      currentRoute: widget.currentRoute,
                    ),
                    const SizedBox(width: 24),
                    _NavItem(
                      label: 'SERVICES',
                      route: '/services',
                      currentRoute: widget.currentRoute,
                    ),
                    const SizedBox(width: 24),
                    _NavItem(
                      label: 'OUR PRODUCTS',
                      route: '/works',
                      currentRoute: widget.currentRoute,
                    ),
                    const SizedBox(width: 24),
                    _NavItem(
                      label: 'CONTACT US',
                      route: '/contact',
                      currentRoute: widget.currentRoute,
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  void _closeMenu() {
    setState(() => _isMenuOpen = false);
  }
}

// --- Menu Item Widget ---
class _NavItem extends StatelessWidget {
  final String label;
  final String route;
  final String currentRoute;
  final bool isMobile;
  final VoidCallback? onTap;

  const _NavItem({
    required this.label,
    required this.route,
    required this.currentRoute,
    this.isMobile = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = route == currentRoute;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
        if (onTap != null) onTap!();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 10 : 0,
          horizontal: isMobile ? 8 : 0,
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 15 : 14,
            fontWeight: FontWeight.w600,
            color: isActive
                ? AppColors.accentColor
                : Colors.black.withOpacity(0.85),
          ),
        ),
      ),
    );
  }
}
