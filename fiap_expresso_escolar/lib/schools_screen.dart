// schools_screen.dart

import 'package:flutter/material.dart';
import 'models/school.dart';
import 'package:latlong2/latlong.dart';

class SchoolsScreen extends StatefulWidget {
  @override
  _SchoolsScreenState createState() => _SchoolsScreenState();
}

class _SchoolsScreenState extends State<SchoolsScreen> {
  // lista de escolas 
  final List<School> schools = [
    School('FIAP School', LatLng(-23.5743, -46.6236)),
    School('Colégio Albuquerque', LatLng(-23.5747, -46.6943)),
    School('Colégio Objetivo', LatLng(-23.564, -46.6528)),
  ];

  // confirmar logout
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar Logout'),
        content: Text('Você tem certeza que deseja sair?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: Text('Sair'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolher Escola'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _confirmLogout(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Expresso Escolar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Meu Perfil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Escolher Escola'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Agendar Transporte'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/schedule');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Sobre Nós'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                Navigator.pop(context);
                _confirmLogout(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: schools.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading:
                Icon(Icons.school, color: Theme.of(context).primaryColor),
            title: Text(schools[index].name,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary)),
            subtitle: Text(
                'Localização: ${schools[index].location.latitude}, ${schools[index].location.longitude}'),
            onTap: () {
              Navigator.pushNamed(context, '/drivers',
                  arguments: schools[index]);
            },
          );
        },
      ),
    );
  }
}
