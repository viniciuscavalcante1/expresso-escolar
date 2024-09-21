// forgot_password_screen.dart

import 'package:flutter/material.dart';
import 'models/user.dart';
import 'main.dart'; // para acessar registeredUsers

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? _securityQuestion;
  final TextEditingController _securityAnswerController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  User? _user;

  void _findUser() {
    if (_formKey.currentState!.validate()) {
      User? user = registeredUsers.firstWhere(
        (user) => user.email == _emailController.text.trim(),
        orElse: () => User(
          email: '',
          password: '',
          securityQuestion: '',
          securityAnswer: '',
        ),
      );
      if (user.email.isEmpty) {
        _showErrorDialog('Usuário não encontrado.');
      } else {
        setState(() {
          _user = user;
          _securityQuestion = user.securityQuestion;
        });
      }
    }
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      if (_securityAnswerController.text.trim() == _user!.securityAnswer) {
        setState(() {
          _user!.password = _newPasswordController.text.trim();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Senha redefinida com sucesso!')),
        );
        Navigator.pop(context);
      } else {
        _showErrorDialog('Resposta de segurança incorreta.');
      }
    }
  }

  void _showErrorDialog(String message) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Erro'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redefinir Senha'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _user == null
              ? Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Insira seu email para buscar sua conta.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _findUser,
                        child: Text('Buscar Conta'),
                      ),
                    ],
                  ),
                )
              : Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Pergunta de Segurança:',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _securityQuestion ?? '',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _securityAnswerController,
                        decoration: InputDecoration(
                          labelText: 'Resposta',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira a resposta';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _newPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Nova Senha',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira a nova senha';
                          } else if (value.length < 6) {
                            return 'A senha deve ter pelo menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _resetPassword,
                        child: Text('Redefinir Senha'),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
