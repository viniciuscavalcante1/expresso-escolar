// schedule_screen.dart

import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  TimeOfDay? _selectedTime;

  void _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  void _saveSchedule() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Horário salvo: ${_selectedTime?.format(context) ?? ''}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Transporte'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                'Selecione o horário de saída:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickTime,
                child: Text('Escolher Horário'),
              ),
              SizedBox(height: 20),
              Text(
                _selectedTime != null
                    ? 'Horário selecionado: ${_selectedTime!.format(context)}'
                    : 'Nenhum horário selecionado',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _saveSchedule,
                child: Text('Salvar Horário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
