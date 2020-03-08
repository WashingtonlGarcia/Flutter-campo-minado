import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../models/campo.dart';
import '../models/explosao_exception.dart';
import '../components/campo_widget.dart';

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
    Campo vizinho = Campo(linha: 1, coluna: 0);
    vizinho.minar();
    Campo vizinho2 = Campo(linha: 1, coluna: 1);
    vizinho2.minar();
    campo.adicionarVizinho(vizinho);
    campo.adicionarVizinho(vizinho2);
    try {
      //campo.minar();
      campo.alternarMarcacao();
      //campo.abrir();
    } on ExplosaoException {}
    return Scaffold(
      appBar: ResultadoWidget(venceu: true, onReniciar: _reniciar),
      body: Container(
        child: CampoWidget(
          campo: campo,
          onAbrir: _abrir,
          onAlternarMarcacao: _alternarMarcacao,
        ),
      ),
    );
  }
}
