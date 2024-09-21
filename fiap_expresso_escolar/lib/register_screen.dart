// register_screen.dart

import 'package:flutter/material.dart';
import 'models/user.dart';
import 'main.dart'; // p acessar registeredUsers

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>(); // chave do formulário
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _securityQuestionController =
      TextEditingController();
  final TextEditingController _securityAnswerController =
      TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      // verifica se o email já tá registrado
      bool userExists = registeredUsers.any(
          (user) => user.email == _emailController.text.trim());

      if (userExists) {
        _showErrorDialog(
            'Email já registrado. Por favor, faça login ou use outro email.');
      } else {
        // adiciona novo usuário na lista
        registeredUsers.add(User(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          name: _nameController.text.trim(),
          securityQuestion: _securityQuestionController.text.trim(),
          securityAnswer: _securityAnswerController.text.trim(),
        ));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registrado com sucesso!')),
        );

        // volta p tela de login
        Navigator.pop(context);
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
        title: Text('Registrar-se'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // campo de nome
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // campo de email
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
                    } else if (!value.contains('@')) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // campo de senha
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a senha';
                    } else if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // pergunta de segurança
                TextFormField(
                  controller: _securityQuestionController,
                  decoration: InputDecoration(
                    labelText: 'Pergunta de Segurança',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.question_answer),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma pergunta de segurança';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // resposta de segurança
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
                SizedBox(height: 40),
                // botão de registrar
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text('Registrar', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
