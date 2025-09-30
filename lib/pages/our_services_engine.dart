import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final List<Map<String, String>> services = [
    {
      "title": "Electrical Panels, Switchboards Design,",
      "desc": "Build and Support Services",
      "image": "assets/images/swtich.jpg",
    },
    {
      "title": "Facilities Management Services",
      "desc": "Modern and functional interior design solutions.",
      "image": "assets/images/man_fix.jpg",
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
      "image": "assets/images/stand2.jpg",
    },
    {
      "title": "Project Engineering, Design and Construction",
      "desc": "End-to-end site supervision ensuring quality delivery.",
      "image": "assets/images/field.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SingleChildScrollView(
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
                  // Header Section
                  _buildHeaderSection(isMobile),
                  
                  SizedBox(height: isMobile ? 32 : 48),
                  
                  // Services Content
                  isMobile 
                    ? _buildMobileLayout()
                    : _buildDesktopLayout(context),
                  
                  const SizedBox(height: 60),
                  const CustomFooter(),
                ],
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
          Expanded(
            flex: 3,
            child: _buildSelectedServiceCard(),
          ),
          
          const SizedBox(width: 24),
          
          // Right side: Services List
          Expanded(
            flex: 2,
            child: _buildServicesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildSelectedServiceCard(),
        const SizedBox(height: 24),
        SizedBox(
          height: 500,
          child: _buildServicesList(),
        ),
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
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              services[selectedIndex]["image"]!,
              fit: BoxFit.cover,
            ),
            
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
                    // Service Number Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "0${selectedIndex + 1}",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Title
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
                    
                    // Description
                    Text(
                      services[selectedIndex]["desc"]!,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
        padding: const EdgeInsets.all(8),
        itemCount: services.length,
        separatorBuilder: (context, index) => Divider(
          color: AppColors.textColor.withOpacity(0.1),
          height: 1,
        ),
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
            color: isSelected
                ? AppColors.accentColor
                : Colors.transparent,
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

class _DrawerNavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DrawerNavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.lato().copyWith(
          color: AppColors.textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
      hoverColor: AppColors.secondaryBackground,
    );
  }
}