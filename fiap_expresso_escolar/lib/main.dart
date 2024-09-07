import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'map_screen.dart';
import 'rating_screen.dart';
import 'schools_screen.dart';
import 'drivers_screen.dart';

void main() {
  runApp(MyApp());
}

// classe principal do aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // definindo o tema e as rotas principais do app
    return MaterialApp(
      title: 'Expresso Escolar',
      theme: ThemeData(
        primaryColor: Color(0xFFFFC659), // cor primária: amarelo
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF5C4033), // cor secundária: marrom
        ),
        scaffoldBackgroundColor: Colors.white, // fundo branco
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Color(0xFF5C4033), fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Color(0xFF5C4033)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFC659), // cor do botão
            foregroundColor: Colors.white, // cor do texto
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // bordas arredondadas no botão
            ),
          ),
        ),
      ),
      initialRoute: '/', // rota inicial do app
      routes: {
        '/': (context) => LoginScreen(), // rota para a tela de login
        '/map': (context) => MapScreen(), // rota para a tela do mapa
        '/rating': (context) => RatingScreen(), // rota para a tela de avaliação
        '/schools': (context) => SchoolsScreen(), // rota para a tela de seleção de escolas
        '/drivers': (context) => DriversScreen(), // rota para a tela de motoristas
      },
    );
  }
}
