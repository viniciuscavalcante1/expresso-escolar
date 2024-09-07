import 'package:flutter/material.dart';
import 'models/school.dart';
import 'package:latlong2/latlong.dart';

// tela de seleção de escolas
class SchoolsScreen extends StatelessWidget {
  // lista de escolas disponíveis
  final List<School> schools = [
    School('FIAP School', LatLng(-23.5743, -46.6236)), // localização da FIAP
    School('Colégio Albuquerque', LatLng(-23.5747, -46.6943)), // localização do colégio Albuquerque
    School('Colégio Objetivo', LatLng(-23.564, -46.6528)), // localização do colégio Objetivo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolher Escola'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: schools.length,
        itemBuilder: (context, index) {
          // cada escola é exibida como um ListTile
          return ListTile(
            title: Text(schools[index].name, style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
            subtitle: Text('Localização: ${schools[index].location.latitude}, ${schools[index].location.longitude}'),
            onTap: () {
              // ao clicar, vai para a tela de motoristas
              Navigator.pushNamed(context, '/drivers', arguments: schools[index]);
            },
          );
        },
      ),
    );
  }
}
