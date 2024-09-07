import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

// tela de mapa que exibe a localização do motorista
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng driverLocation; // armazena a localização atual do motorista
  Timer? timer; // timer para simular movimento

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    driverLocation = ModalRoute.of(context)!.settings.arguments as LatLng; // pega a localização passada pela rota

    // simula o movimento do motorista, atualizando a posição a cada 2 segundos
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {
        driverLocation = LatLng(driverLocation.latitude + 0.001, driverLocation.longitude + 0.001);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // cancela o timer ao sair da tela
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
        options: MapOptions(
          center: driverLocation, // define a localização inicial do mapa
          zoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: driverLocation, // exibe o marcador na localização atual
                builder: (ctx) => Icon(Icons.directions_bus, color: Colors.amber, size: 40), // ícone do ônibus
              ),
            ],
          ),
        ],
      ),
    );
  }
}
