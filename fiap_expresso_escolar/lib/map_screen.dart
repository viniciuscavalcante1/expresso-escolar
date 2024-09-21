// map_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng driverLocation;
  Timer? timer;
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    driverLocation = ModalRoute.of(context)!.settings.arguments as LatLng;

    // simula o movimento do motorista
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {
        driverLocation = LatLng(
          driverLocation.latitude + 0.0001,
          driverLocation.longitude + 0.0001,
        );
        _mapController.move(driverLocation, _mapController.zoom);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localização do Motorista'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: driverLocation,
          zoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: driverLocation,
                builder: (ctx) => Icon(
                  Icons.directions_bus,
                  color: Colors.amber,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/rating');
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.rate_review),
      ),
    );
  }
}
