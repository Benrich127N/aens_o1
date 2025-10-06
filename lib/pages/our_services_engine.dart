import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../utils/custom_nav_bar.dart' as nav;
import '../utils/footer.dart' show CustomFooter;
import '../utils/theme.dart';

class Our_services_engine extends StatefulWidget {
  const Our_services_engine({super.key});

  @override
  State<Our_services_engine> createState() => _Our_services_engineState();
}

class _Our_services_engineState extends State<Our_services_engine> {
  int selectedIndex = 0;
  Timer? _autoSlideTimer;
  static const Duration _slideDuration = Duration(seconds: 5);

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(_slideDuration, (timer) {
      setState(() {
        selectedIndex = (selectedIndex + 1) % services.length;
      });
    });
  }

  final List<Map<String, String>> services = [
    {
      "title": "Electrical Panels, Switchboards Design,",
      "desc": "Build and Support Services",
      "image": "assets/images/swtich.jpg",
    },
    {
      "title": "Facilities Management Services",
      "desc": "Modern and functional interior design solutions.",
      "image": "assets/images/enn1.jpg",
    },
    {
      "title": "Medium / Low Voltage (MV/LV) Products Retailers",
      "desc": "Engineering precision with innovative structural solutions.",
      "image": "assets/images/conc.jpg",
    },
    {
      "title": "Project And Construction Management Services",
      "desc": "Efficient planning and seamless project execution.",
      "image": "assets/images/wind.jpg",
    },
    {
      "title": "Electrical Equipment Testing and Calibration",
      "desc": "Reliable MEP services with innovative engineering.",
      "image": "assets/images/enn3.jpg",
    },
    {
      "title": "Project Engineering, Design and Construction",
      "desc": "End-to-end site supervision ensuring quality delivery.",
      "image": "assets/images/field.jpg",
    },
  ];
  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      endDrawer: Builder(
        builder: (drawerContext) => isMobile
            ? Drawer(
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
                        Navigator.pop(drawerContext);
                        Navigator.pushNamed(drawerContext, '/about');
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'SERVICES',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(drawerContext);
                        Navigator.pushNamed(drawerContext, '/services');
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'OUR PRODUCTS',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(drawerContext);
                        Navigator.pushNamed(drawerContext, '/works');
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'CONTACT US',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(drawerContext);
                        Navigator.pushNamed(drawerContext, '/contact');
                      },
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight),
              child: Column(
                children: [
                  const nav.CustomNavBar(currentRoute: '/services'),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 40,
                      vertical: isMobile ? 24 : 60,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderSection(isMobile),
                        SizedBox(height: isMobile ? 32 : 48),
                        isMobile
                            ? _buildMobileLayout()
                            : _buildDesktopLayout(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: isMobile ? 16 : 24),

                // Clients section now outside padding for full-width background
                _buildClientsSection(isMobile),
              ],
            ),

            Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 80),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.accentColor.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),

            const CustomFooter(), // ✅ correct placement
          ],
        ),
      ),
    );
  }

  Widget _buildClientsSection(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 10 : 5,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryBackground,
            AppColors.secondaryBackground.withOpacity(0.3),
            AppColors.primaryBackground,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "OUR CLIENTS",
              style: GoogleFonts.poppins(
                color: AppColors.accentColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 16),

          Text(
            "Trusted by Leading Institutions",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 40,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),

          const SizedBox(height: 12),

          // Add description
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              "We pride ourselves on delivering exceptional service to a diverse portfolio of clients across government, oil & gas, and corporate sectors.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 14 : 16,
                color: AppColors.textColor.withOpacity(0.7),
                height: 1.6,
              ),
            ),
          ),

          SizedBox(height: isMobile ? 32 : 48),

          // Clients Grid
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // ✅ disable inner scrolling

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                crossAxisSpacing: 24,
                mainAxisExtent: 800,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 0.8 : 0.75, // adjust here
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildClientCard(
                    title: "Government Department & Agencies",
                    clients: [
                      "Ministry of Power, Rivers State",
                      "House Hospital Complex Bayelsa",
                      "Otuoke Hospital Facility Bayelsa",
                      "General Hospital Complex Yenagoa",
                    ],
                    scope: [
                      "Construction & Installation of 33/11kV Lines",
                      "Procurement, Installation, and Maintenance of MV/LV Transformer Substations, Switchgears, AMF/ATS Panels, MCCs",
                      "Industrial & Utility Services",
                      "Rural and Industrial Electrification Projects",
                    ],
                    image: "assets/images/gov_clients.jpg",
                  );
                } else if (index == 1) {
                  return _buildClientCard(
                    title: "Oil, Gas & Marine Services",
                    clients: [
                      "V.Ships",
                      "Thome Group",
                      "Remm Oil Services",
                      "Baker Hughes",
                    ],
                    scope: [
                      "Marine Electrical Engineering Maintenance Services",
                      "Installation & Maintenance of Marine Communication Systems",
                      "Design & Construction of Power Distribution Panels",
                      "Supply & Installation of ABB & Schneider Electric LV Products",
                    ],
                    image: "assets/images/oil_clients.jpg",
                  );
                } else {
                  return _buildClientCard(
                    title: "Companies & Banks",
                    clients: [
                      "STARZS",
                      "Avondale",
                      "PHD",
                      "Other financial institutions",
                    ],
                    scope: [
                      "Design & Installation of Medium & Low Voltage Systems",
                      "Maintenance of Communication Systems",
                      "Installation & Maintenance of Transformers, Motors, Compressors & UPS",
                    ],
                    image: "assets/images/banks_clients.jpg",
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientCard({
    required String title,
    required List<String> clients,
    required List<String> scope,
    required String image,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.textColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image Section (Fixed height 180)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
              ),
            ),

            // 2. Content Section (The main fix is here)
            // We wrap the rest of the Column content in Expanded + SingleChildScrollView
            Expanded(
              // <--- WRAP in Expanded
              child: SingleChildScrollView(
                // <--- WRAP in SingleChildScrollView
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentColor,
                          letterSpacing: 0.3,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Key Clients Section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.accentColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.accentColor.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.business_rounded,
                                  size: 18,
                                  color: AppColors.accentColor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Key Clients",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColor,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // The `clients` list
                            ...clients.map(
                              (c) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: AppColors.accentColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        c,
                                        style: GoogleFonts.poppins(
                                          color: AppColors.textColor
                                              .withOpacity(0.85),
                                          fontSize: 14,
                                          height: 1.5,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Scope of Work Section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.textColor.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.textColor.withOpacity(0.08),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.engineering_rounded,
                                  size: 18,
                                  color: AppColors.accentColor,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Scope of Work",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColor,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // The `scope` list
                            ...scope.map(
                              (s) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: AppColors.accentColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        s,
                                        style: GoogleFonts.poppins(
                                          color: AppColors.textColor
                                              .withOpacity(0.85),
                                          fontSize: 14,
                                          height: 1.5,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Subtitle
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "WHAT WE OFFER",
            style: GoogleFonts.poppins(
              color: AppColors.accentColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Main Title
        Text(
          "Our Services",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),

        // Description
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            "Comprehensive engineering solutions tailored to meet your needs with excellence and innovation.",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 16,
              color: AppColors.textColor.withOpacity(0.7),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Row(
        children: [
          // Left side: Selected Service Display
          Expanded(flex: 3, child: _buildSelectedServiceCard()),

          const SizedBox(width: 24),

          // Right side: Services List
          Expanded(flex: 2, child: _buildServicesList()),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        AspectRatio(aspectRatio: 16 / 9, child: _buildSelectedServiceCard()),
        const SizedBox(height: 24),
        SizedBox(height: 500, child: _buildServicesList()),
      ],
    );
  }

  Widget _buildSelectedServiceCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(0.1, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                child: child,
              ),
            );
          },
          child: Stack(
            key: ValueKey<int>(selectedIndex),
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.asset(services[selectedIndex]["image"]!, fit: BoxFit.cover),

              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.85),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),

              // Content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ======== TOP ROW: Badge + Dots (pause removed) ========
                      Row(children: [
                        
                        ],
                      ),

                      const SizedBox(height: 20),

                      // ======== TITLE ========
                      Text(
                        services[selectedIndex]["title"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // ======== DESCRIPTION ========
                      Text(
                        services[selectedIndex]["desc"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 20),

                      //
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServicesList() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.textColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: services.length,
        separatorBuilder: (context, index) =>
            Divider(color: AppColors.textColor.withOpacity(0.1), height: 1),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return _buildServiceListItem(index, isSelected);
        },
      ),
    );
  }

  Widget _buildServiceListItem(int index, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accentColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.accentColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Number Badge
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.accentColor
                    : AppColors.textColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "0${index + 1}",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? Colors.white
                        : AppColors.textColor.withOpacity(0.6),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Service Title
            Expanded(
              child: Text(
                services[index]["title"]!,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? AppColors.accentColor
                      : AppColors.textColor.withOpacity(0.8),
                  height: 1.4,
                ),
              ),
            ),

            // Arrow Icon
            if (isSelected)
              Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.accentColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
