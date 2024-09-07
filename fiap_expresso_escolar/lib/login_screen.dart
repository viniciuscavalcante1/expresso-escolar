import 'package:flutter/material.dart';

// tela de login do aplicativo
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // logo do aplicativo
            Image.asset(
              'assets/images/logo.png', // caminho da imagem do logo
              height: 120, // altura da imagem
            ),
            SizedBox(height: 40), // espaçamento
            // campo de texto para email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            // campo de texto para senha
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true, // campo de senha
            ),
            SizedBox(height: 40),
            // botão de login
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/schools'); // ao clicar, vai para a tela de escolas
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('Entrar', style: TextStyle(fontSize: 18)),
            ),
            // botão para criar uma conta
            TextButton(
              onPressed: () {
                // ação de criar conta
              },
              child: Text('Criar uma conta', style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ],
        ),
      ),
    );
  }
}
