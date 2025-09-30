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
    return Scaffold(
      backgroundColor: Colors.black,
      // The `endDrawer` from the original code handles the mobile menu,
      // and it needs to be placed on every page where you want to use it.
      // You could also create a common Scaffold widget to reuse this.
      // endDrawer: Drawer(
      //   backgroundColor: AppColors.primaryBackground,
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: const BoxDecoration(
      //           color: AppColors.secondaryBackground,
      //         ),
      //         child: Align(
      //           alignment: Alignment.centerLeft,
      //           child: Row(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               Icon(
      //                 Icons.architecture_outlined,
      //                 color: AppColors.accentColor,
      //                 size: 22.0,
      //               ),
      //               const SizedBox(width: 8),
      //               Text(
      //                 'AENS ENGINNERING',
      //                 style: GoogleFonts.montserrat(
      //                   color: AppColors.textColor,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 20.0,
      //                   letterSpacing: 1.2,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       _DrawerNavItem(
      //         label: 'ABOUT US',
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/about');
      //         },
      //       ),
      //       _DrawerNavItem(
      //         label: 'SERVICES',
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/services');
      //         },
      //       ),
      //       _DrawerNavItem(
      //         label: 'OUR WORKS',
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/works');
      //         },
      //       ),
      //       _DrawerNavItem(
      //         label: 'CONTACT US',
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/contact');
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          // Place the CustomNavBar widget directly here as the first child
          // of the main Column.
          children: [
            const nav.CustomNavBar(currentRoute: '/services'),

            // Then, place your existing page content inside a Padding widget
            // to maintain the horizontal spacing.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top text section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "to Meet Your Needs",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  // Our Services heading
                  Text(
                    "Our Services",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Services content row
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height *
                        0.7, // Adjust height as needed
                    child: Row(
                      children: [
                        // Left side: Selected Service Image & Details
                        Expanded(
                          flex: 2,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  services[selectedIndex]["image"]!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Container(color: Colors.black.withOpacity(0.4)),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                right: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      services[selectedIndex]["title"]!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      services[selectedIndex]["desc"]!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Right side: Vertical service list
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: services.length,
                            itemBuilder: (context, index) {
                              final isSelected = selectedIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    color: isSelected
                                        ? Colors.blue[50]
                                        : Colors.transparent,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor: isSelected
                                            ? Colors.blue[900]
                                            : Colors.grey.shade300,
                                        child: Text(
                                          (index + 1).toString().padLeft(
                                            2,
                                            "0",
                                          ),
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: isSelected
                                                ? Colors.white
                                                : const Color.fromARGB(
                                                    255,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                          ),
                                        ),
                                      ),

                                      /////// ghtyhjghjkhj
                                      ///
                                      ///
                                      ///
                                      ///
                                      ///
                                      ///
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          services[index]["title"]!,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: isSelected
                                                ? Colors.blue[900]
                                                : const Color.fromARGB(
                                                    221,
                                                    142,
                                                    140,
                                                    140,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  const CustomFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// NOTE: You'll also need to include the _DrawerNavItem class to make the endDrawer functional.
// This is not part of the `CustomNavBar` widget itself, but it's required for the mobile menu to work on this page.
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
