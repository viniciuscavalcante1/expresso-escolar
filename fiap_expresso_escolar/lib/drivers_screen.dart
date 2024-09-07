import 'package:flutter/material.dart';
import 'models/school.dart';
import 'package:latlong2/latlong.dart';

// classe Driver para armazenar informações dos motoristas
class Driver {
  final String name;
  final LatLng location;

  Driver(this.name, this.location); // construtor
}

// tela que exibe os motoristas disponíveis
class DriversScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // recebe os dados da escola selecionada
    final School school = ModalRoute.of(context)!.settings.arguments as School;

    // lista de motoristas com localizações simuladas
    final List<Driver> drivers = [
      Driver('Carlos Santos', LatLng(school.location.latitude + 0.001, school.location.longitude + 0.001)),
      Driver('Maria Souza', LatLng(school.location.latitude + 0.002, school.location.longitude + 0.002)),
      Driver('José Oliveira', LatLng(school.location.latitude + 0.003, school.location.longitude + 0.003)),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Motoristas - ${school.name}'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          // cada motorista é exibido com um botão para ver a localização
          return ListTile(
            leading: Icon(Icons.directions_bus, color: Colors.amber), // ícone amarelo do ônibus
            title: Text(drivers[index].name),
            trailing: ElevatedButton(
              onPressed: () {
                // ao clicar, vai para a tela de mapa mostrando a localização do motorista
                Navigator.pushNamed(context, '/map', arguments: drivers[index].location);
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
