import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  // Variavel do index de perguntas
  var _perguntaSelecionada = 0;

  // variavel de sua pontuacao total
  var _pontuacaoTotal = 0;

  // Array de perguntas
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 1},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 1},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 1},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    }
  ];

  // Funcao de estado da Aplicacao
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        // Proximo index do array de Perguntas
        _perguntaSelecionada++;

        // Adicionando valor da sua pontuacao para variavel
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  // Funcao de reiniciar aplicacao
  void _reiniciarQuestionario() {
    setState(() {
      // Reiniciando index aplicacao
      _perguntaSelecionada = 0;

      // Zerar pontuacao
      _pontuacaoTotal = 0;
    });
  }

  // valor boleano para verificar se ainda existem perguntas para serem respondidas.
  bool get temPerguntaSelecionada {
    // Caso o index seja menor que a quantidade de elementos no array de perguntas retorne false
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Componente Superior
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(
            'Perguntas',
            style: (TextStyle(fontSize: 35)),
          ),
        ),
        // Componente de Body da aplicacao &&
        body: temPerguntaSelecionada
            //  verificacao caso o retorno do valor boleano retore true, renderize as perguntas.
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
                temPerguntaSelecionada: temPerguntaSelecionada,
              )
            // verificacao caso o retono do valor boleano retorne false, renderize o valor final com o resultado.
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

// Criando um componente sem estado
class PerguntaApp extends StatefulWidget {
  // CreateState para o componente de renderizacao
  _PerguntaAppState createState() {
    // Retornando o componente com estado
    return _PerguntaAppState();
  }
}
