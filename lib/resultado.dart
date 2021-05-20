import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  // Recebe o valor final para renderizar na tela.
  final int pontuacao;

  // recebe uma funcao para reiciar o questionario.
  final void Function() quandoReiniciarQuestionario;

  Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario,
  );

  String get fraseResultado {
    if (pontuacao < 5) {
      return 'Bom';
    } else if (pontuacao < 10) {
      return 'Muito bom';
    } else if (pontuacao < 15) {
      return 'Brabissimo';
    } else {
      return 'Meu Mestre';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: quandoReiniciarQuestionario,
            child: Text(
              'Reiniciar Questionario',
              style: TextStyle(fontSize: 30, color: Colors.amberAccent),
            ))
      ],
    );
  }
}
