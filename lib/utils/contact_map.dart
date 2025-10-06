import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:ui_web' as ui_web;
import 'package:web/web.dart' as web;

class ContactMap extends StatefulWidget {
  const ContactMap({super.key});

  @override
  State<ContactMap> createState() => _ContactMapState();
}

class _ContactMapState extends State<ContactMap> {
  static const String _viewType = 'google-map-iframe';

  static const String _iframeUrl =
      "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3975.832017559444!2d7.0046623!3d4.798875499999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1069cdaaaaaaaaab%3A0x262fbc6f4dd9ee20!2sAens%20Project%20%26%20Engineering%20Services%20Ltd!5e0!3m2!1sen!2sng!4v1759755056687!5m2!1sen!2sng";

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
        // Default light styling
        final iframe = web.HTMLIFrameElement()
          ..src = _iframeUrl
          ..style.border = '0'
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.borderRadius = '16px'
          ..style.transition = 'filter 0.3s ease, box-shadow 0.3s ease'
          ..style.boxShadow = '0 8px 25px rgba(0, 0, 0, 0.25)'
          ..style.filter = 'grayscale(5%) brightness(98%) contrast(102%)';
        return iframe;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (!kIsWeb) {
      return Container(
        height: 400,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          "Map available on web version",
          style: TextStyle(
            fontSize: 16,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
        ),
      );
    }

    // Dynamic brightness for dark or light mode
    final iframeStyle = isDark
        ? 'grayscale(15%) brightness(65%) contrast(110%) saturate(90%)'
        : 'grayscale(5%) brightness(98%) contrast(102%)';

    // Re-register the iframe each build with updated dark/light filter
    if (kIsWeb) {
      ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
        final iframe = web.HTMLIFrameElement()
          ..src = _iframeUrl
          ..style.border = '0'
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.borderRadius = '16px'
          ..style.boxShadow = isDark
              ? '0 8px 30px rgba(255, 255, 255, 0.08)'
              : '0 8px 25px rgba(0, 0, 0, 0.25)'
          ..style.transition = 'filter 0.4s ease'
          ..style.filter = iframeStyle;
        return iframe;
      });
    }

    return SizedBox(
      width: double.infinity,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: const HtmlElementView(viewType: _viewType),
      ),
    );
  }
}
