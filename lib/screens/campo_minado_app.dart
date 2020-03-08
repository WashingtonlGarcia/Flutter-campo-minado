import 'package:campoMinado/components/tabuleiro_widget.dart';
import 'package:campoMinado/models/explosao_exception.dart';
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
  Tabuleiro _tabuleiro;
  _reniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro.reiniciar();
    });
  }

  _abrir(Campo c) {
    if (_venceu != null) {
      return;
    }
    setState(() {
      try {
        c.abrir();
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro.revelarBombas();
      }
    });
  }

  _alternarMarcacao(Campo c) {
    setState(() {
      c.alternarMarcacao();
      if (_tabuleiro.resolvido) {
        _venceu = true;
      }
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdeColunas = 15;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();
      _tabuleiro =
          Tabuleiro(linhas: qtdeLinhas, colunas: qtdeColunas, qtdeBombas: 50);
    }
    return _tabuleiro;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: ResultadoWidget(venceu: _venceu, onReniciar: _reniciar),
      body: Container(child: LayoutBuilder(builder: (ctx, constrains) {
        return TabuleiroWidget(
          tabuleiro: _getTabuleiro(constrains.maxWidth, constrains.maxHeight),
          onAbrir: _abrir,
          onAlternarMarcacao: _alternarMarcacao,
        );
      })),
    );
  }
}
