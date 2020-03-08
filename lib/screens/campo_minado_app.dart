import 'package:campoMinado/components/tabuleiro_widget.dart';
import 'package:campoMinado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../models/campo.dart';

class CampoMinado extends StatefulWidget {
  @override
  _CampoMinadoState createState() => _CampoMinadoState();
}

class _CampoMinadoState extends State<CampoMinado> {
  bool _venceu;
  Tabuleiro _tabuleiro = Tabuleiro(colunas: 15, linhas: 15, qtdeBombas: 10);
  _reniciar() {
    print("reniciar");
  }

  _abrir(Campo c) {
    setState(() {
      c.abrir();
    });
  }

  _alternarMarcacao(Campo c) {
    setState(() {
      c.alternarMarcacao();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultadoWidget(venceu: _venceu, onReniciar: _reniciar),
      body: Container(
          child: TabuleiroWidget(
              tabuleiro: _tabuleiro,
              onAbrir: _abrir,
              onAlternarMarcacao: _alternarMarcacao)),
    );
  }
}
