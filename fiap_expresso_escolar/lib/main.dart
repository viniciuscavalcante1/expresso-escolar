// main.dart

import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';
import 'profile_screen.dart';
import 'about_screen.dart';
import 'map_screen.dart';
import 'rating_screen.dart';
import 'schools_screen.dart';
import 'drivers_screen.dart';
import 'schedule_screen.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

// lista global de usuários registrados
List<User> registeredUsers = [];

// índice do usuário logado atualmente
int currentUserIndex = -1;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expresso Escolar',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFFFC659), // cor amarela
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF5C4033), // cor marrom
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: Color(0xFF5C4033),
              fontSize: 24,
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Color(0xFF5C4033)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFC659), // cor amarela
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // cantos arredondados
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[800], // cor cinza escuro
        colorScheme: ColorScheme.dark(
          primary: Colors.grey[800]!,
          secondary: Colors.amber,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.system, // segue o tema do sistema
      initialRoute: '/splash', // rota inicial é a splash screen
      routes: {
        '/splash': (context) => SplashScreen(),
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/profile': (context) => ProfileScreen(),
        '/about': (context) => AboutScreen(),
        '/map': (context) => MapScreen(),
        '/rating': (context) => RatingScreen(),
        '/schools': (context) => SchoolsScreen(),
        '/drivers': (context) => DriversScreen(),
        '/schedule': (context) => ScheduleScreen(),
      },
    );
  }
}
