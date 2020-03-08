import 'package:campoMinado/components/tabuleiro_widget.dart';
import 'package:campoMinado/models/tabuleiro.dart';
import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../models/campo.dart';

class CampoMinado extends StatelessWidget {
  final Campo campo = Campo(linha: 0, coluna: 0);
  _reniciar() {
    print("reniciar");
  }

  _abrir(Campo c) {
    print("abrir");
  }

  _alternarMarcacao(Campo c) {
    print("alternar");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultadoWidget(venceu: true, onReniciar: _reniciar),
      body: Container(
          child: TabuleiroWidget(
              tabuleiro: Tabuleiro(colunas: 15, linhas: 15, qtdeBombas: 10),
              onAbrir: _abrir,
              onAlternarMarcacao: _alternarMarcacao)),
    );
  }
}
