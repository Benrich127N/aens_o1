import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/custom_nav_bar.dart';
import '../utils/footer.dart' show CustomFooter;
import '../utils/theme.dart';
import 'dart:async';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  int _currentImageIndex = 0;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  // List of your background images
  final List<String> _backgroundImages = [
    "assets/images/stand.jpg",
    "assets/images/enn1.jpg", // Add your other images here
    "assets/images/Schneider14.jpg",
    // Add more images as needed
  ];

  // Corresponding text for each image (optional)
  final List<String> _headlineTexts = [
    "Providing innovative \nand dependable engineering solutions...",
    "Building the future \nwith cutting-edge technology...",
    "Excellence in every \nproject we undertake...",
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.1, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-0.3, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
          ),
        );

    _animationController.forward();

    // Start the timer to change images every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _changeImage();
    });
  }

  void _changeImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _backgroundImages.length;
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1024;

    final double horizontalPadding = isMobile ? 16 : (isTablet ? 24 : 40);
    final double headlineSize = isMobile ? 28 : (isTablet ? 36 : 48);
    final double subTextSize = isMobile ? 14 : (isTablet ? 16 : 18);

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      endDrawer: Drawer(
        backgroundColor: AppColors.primaryBackground,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColors.secondaryBackground),
              child: Text(
                'AENS ENGINEERING',
                style: TextStyle(color: Colors.white, fontSize: 18),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: height),
              child: Stack(
                children: [
                  // Animated background image
                  Positioned.fill(
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return FadeTransition(
                          opacity: _fadeAnimation,
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Image.asset(
                              _backgroundImages[_currentImageIndex],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: Container(color: Colors.black.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomNavBar(currentRoute: '/home'),
                        SizedBox(height: isMobile ? 16 : 24),
                        // Animated text that slides in
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return SlideTransition(
                              position: _slideAnimation,
                              child: FadeTransition(
                                opacity: _fadeAnimation,
                                child: DefaultTextStyle(
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: headlineSize,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                  child: Text(
                                    _headlineTexts[_currentImageIndex],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: Text(
                                "Engineering, Procurement, Construction, Maintenance, & Project Management Services RC 793235",
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: subTextSize,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return FadeTransition(
                              opacity: _fadeAnimation,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 20 : 24,
                                    vertical: isMobile ? 12 : 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/contact');
                                },
                                child: Text(
                                  "WORK WITH US",
                                  style: GoogleFonts.poppins(
                                    fontSize: isMobile ? 14 : 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: isMobile ? 16 : 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
