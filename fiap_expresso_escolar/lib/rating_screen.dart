import 'package:flutter/material.dart';

class RatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliação do Motorista', style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Icon(Icons.star, color: Colors.amber, size: 100),
            Slider(
              value: 3,
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: (value) {
                // Ação da avaliação
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
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
