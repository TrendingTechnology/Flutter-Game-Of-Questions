import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  // Objeto de array de perguntas recebida como Props de Main.dart.
  final List<Map<String, Object>> perguntas;

  // inteiro do index de array de perguntas recebida como Props de Main.dart.
  final int perguntaSelecionada;

  // funcao de proxima pergunta e gerir o valor final do questionario recebida como Props de Main.dart.
  final void Function(int) quandoResponder;

  // valor boleano para verificar se ainda existem perguntas para serem respondidas, recebida como Props de Main.dart.
  final bool temPerguntaSelecionada;

  // Construtor para Atributo da Class.
  Questionario({
    // @required quer dizer que caso nao receba algum dos atributos a funcao nao é exetutada.
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
    @required this.temPerguntaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    // De acordo com verificacao boleano, crie as questoes da Lista de Perguntas
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: <Widget>[
        // Componenter de renderizar texto do titulo da questao
        Questao(perguntas[perguntaSelecionada]['texto']),
        // Renderize todas as respostas
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => quandoResponder(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
