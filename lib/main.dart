import 'package:flutter/material.dart';
import 'package:tailored_space/pages/about_page.dart';
import 'package:tailored_space/pages/our_services_engine.dart';
import 'package:tailored_space/pages/test.dart';
import 'package:tailored_space/pages/works_page.dart';
import 'package:tailored_space/pages/contact_page.dart';
import 'package:tailored_space/pages/discuss_page.dart';
import 'package:tailored_space/pages/learn_more_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Test(),
        '/about': (context) => const AboutPage(),
        '/services': (context) => const Our_services_engine(),
        '/works': (context) => const WorksPage(),
        '/contact': (context) => const ContactPage(),
        '/discuss': (context) => const DiscussPage(),
        '/learn-more': (context) => const LearnMorePage(),
      },
    );
  }
}
