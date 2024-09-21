// drivers_screen.dart

import 'package:flutter/material.dart';
import 'models/school.dart';
import 'package:latlong2/latlong.dart';

// informações dos motoristas
class Driver {
  final String name;
  final LatLng location;

  Driver(this.name, this.location); 
}

class DriversScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // recebe a escola
    final School school =
        ModalRoute.of(context)!.settings.arguments as School;

    // lista de motoristas
    final List<Driver> drivers = [
      Driver('Carlos Santos',
          LatLng(school.location.latitude + 0.001, school.location.longitude + 0.001)),
      Driver('Maria Souza',
          LatLng(school.location.latitude + 0.002, school.location.longitude + 0.002)),
      Driver('José Oliveira',
          LatLng(school.location.latitude + 0.003, school.location.longitude + 0.003)),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Motoristas - ${school.name}'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(drivers[index].name[0]), 
            ),
            title: Text(drivers[index].name),
            trailing: ElevatedButton(
              onPressed: () {
                // vai pro mapa com a localização do motorista
                Navigator.pushNamed(context, '/map',
                    arguments: drivers[index].location);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text('Ver localização'),
            ),
          );
        },
      ),
    );
  }
}
