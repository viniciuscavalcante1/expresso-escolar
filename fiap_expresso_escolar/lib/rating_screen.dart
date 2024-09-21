// rating_screen.dart

import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 3;

  void _submitRating() {
    // mostra a avaliação realizada
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Você avaliou o motorista com $_rating estrelas.')),
    );

    // volta pra tela anterior
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliação do Motorista'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Avalie o Motorista',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Icon(Icons.directions_bus, color: Colors.amber, size: 100),
            SizedBox(height: 20),
            Slider(
              value: _rating,
              min: 1,
              max: 5,
              divisions: 4,
              label: _rating.toString(),
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRating,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('Enviar Avaliação', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
