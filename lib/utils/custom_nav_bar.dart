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
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      //container color
      //
      //
      color: const Color.fromARGB(255, 255, 255, 255),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Stack(
        children: [
          // Main Row (Logo + menu / hamburger)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side - Logo or Hamburger
              Row(
                children: [
                  if (isMobile)
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        //color for icon menu when shrinked nav bar
                        //
                        //
                        color: Color.fromARGB(255, 5, 5, 5),
                      ),
                      onPressed: () {
                        setState(() => _isDrawerOpen = true);
                      },
                    )
                  else
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/'),
                      child: const AppLogo(fontSize: 18),
                    ),
                ],
              ),

              // Right side - Menu for Desktop
              if (!isMobile)
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

          // Drawer Overlay for Mobile
          if (isMobile && _isDrawerOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() => _isDrawerOpen = false),
                child: Container(color: Colors.black54),
              ),
            ),

          // Slide-out Drawer
          //color
          //
          //
          if (isMobile && _isDrawerOpen)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: _isDrawerOpen ? 0 : -250,
              top: 0,
              bottom: 0,
              child: Container(
                width: 250,
                color: const Color.fromARGB(255, 211, 208, 208),
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppLogo(fontSize: 20),
                    const SizedBox(height: 30),
                    _DrawerNavItem(
                      label: 'ABOUT US',
                      route: '/about',
                      currentRoute: widget.currentRoute,
                      onClose: () => setState(() => _isDrawerOpen = false),
                    ),
                    _DrawerNavItem(
                      label: 'SERVICES',
                      route: '/services',
                      currentRoute: widget.currentRoute,
                      onClose: () => setState(() => _isDrawerOpen = false),
                    ),
                    _DrawerNavItem(
                      label: 'OUR PRODUCTS',
                      route: '/works',
                      currentRoute: widget.currentRoute,
                      onClose: () => setState(() => _isDrawerOpen = false),
                    ),
                    _DrawerNavItem(
                      label: 'CONTACT US',
                      route: '/contact',
                      currentRoute: widget.currentRoute,
                      onClose: () => setState(() => _isDrawerOpen = false),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// --- Desktop Menu Item ---
class _NavItem extends StatelessWidget {
  final String label;
  final String route;
  final String currentRoute;

  const _NavItem({
    required this.label,
    required this.route,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = route == currentRoute;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, route),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isActive
                //color for shrinked nav bar text
                //
                //
                ? AppColors.accentColor
                : const Color.fromARGB(255, 0, 0, 0).withOpacity(0.85),
          ),
        ),
      ),
    );
  }
}

// --- Drawer Menu Item (for Mobile) ---
class _DrawerNavItem extends StatelessWidget {
  final String label;
  final String route;
  final String currentRoute;
  final VoidCallback onClose;

  const _DrawerNavItem({
    required this.label,
    required this.route,
    required this.currentRoute,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = route == currentRoute;

    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isActive
              ? AppColors.accentColor
              : const Color.fromARGB(99, 9, 8, 8),
        ),
      ),
      onTap: () {
        onClose();
        Navigator.pushNamed(context, route);
      },
    );
  }
}
