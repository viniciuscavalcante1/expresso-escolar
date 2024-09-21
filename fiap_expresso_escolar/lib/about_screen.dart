// about_screen.dart

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String aboutText = '''
Expresso Escolar é um aplicativo projetado para melhorar a mobilidade escolar, conectando pais, estudantes, escolas e motoristas de transporte escolar. Nosso objetivo é oferecer transparência, segurança e eficiência no transporte de alunos, contribuindo para uma mobilidade urbana sustentável.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nós'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          aboutText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
