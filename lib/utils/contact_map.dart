import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ContactMap extends StatefulWidget {
  const ContactMap({super.key});

  @override
  State<ContactMap> createState() => _ContactMapState();
}

class _ContactMapState extends State<ContactMap> {
  final MapController _mapController = MapController();

  double _currentZoom = 16.0; // default zoom level
  final LatLng _location = LatLng(4.8242, 7.0336); // AENS Engineering location

  void _zoomIn() {
    setState(() {
      _currentZoom += 1;
      _mapController.move(_location, _currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom -= 1;
      _mapController.move(_location, _currentZoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // adjust height as needed
      child: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _location,
              initialZoom: _currentZoom,
              interactionOptions: const InteractionOptions(
                flags:
                    InteractiveFlag.all &
                    ~InteractiveFlag.scrollWheelZoom, // disable scroll zoom
              ),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _location,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Zoom Buttons
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.black87,
                  onPressed: _zoomIn,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.black87,
                  onPressed: _zoomOut,
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
