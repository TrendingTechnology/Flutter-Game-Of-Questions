import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  // Recebe uma String como Props de Questionario.dart
  final String texto;

  // Construtor para Atributo da Class.
  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
