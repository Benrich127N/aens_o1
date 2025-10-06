import 'package:flutter/material.dart';
import 'dart:ui'
    show PointerDeviceKind; // for refined scroll behavior on web/desktop
import 'package:tailored_space/pages/about_page.dart';
import 'package:tailored_space/pages/our_services_engine.dart';
import 'package:tailored_space/pages/test.dart';
import 'package:tailored_space/pages/works_page.dart';
import 'package:tailored_space/pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashFactory: InkSparkle.splashFactory,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        hoverColor: const Color(0x14FFFFFF),
        highlightColor: const Color(0x10FFFFFF),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false,
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
        },
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Test(),
        '/about': (context) => const AboutPage(),
        '/services': (context) => const Our_services_engine(),
        '/works': (context) => const WorksPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
