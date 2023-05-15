import 'package:flutter/material.dart';

class InvitadosScreen extends StatelessWidget {
  static const String name = 'invitados_screen';
  const InvitadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('contactos'),
      ),
      body: Text('contactos'),
    );
  }
}