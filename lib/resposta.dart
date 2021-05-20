import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  // Recebe uma String como Props de Questionario.dart
  final String texto;

  // Recebe uma funcao que soma o valor para o resultado final
  final void Function() quandoSelecionado;

  // Construtor para Atributo da Class.
  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.black,
        color: Colors.amberAccent,
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
