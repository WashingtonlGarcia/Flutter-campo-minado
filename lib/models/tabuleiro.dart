import 'dart:math';

import 'campo.dart';
import 'package:flutter/foundation.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdeBombas;

  final List<Campo> _campo = [];
  Tabuleiro({
    @required this.linhas,
    @required this.colunas,
    @required this.qtdeBombas,
  }) {
    _criarCampos();
    _relacionarVizinhos();
  }

  void reniciar() {
    _campo.forEach((element) {
      element.reniciar();
      _sortearMinas();
    });
  }

  void revelarBombas() {
    _campo.forEach((element) => element.revelarBombas());
  }

  void _criarCampos() {
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        _campo.add(Campo(linha: l, coluna: c));
      }
    }
  }

  void _relacionarVizinhos() {
    for (var campo in _campo) {
      for (var vizinho in _campo) {
        campo.adicionarVizinho((vizinho));
      }
    }
  }

  void _sortearMinas() {
    int sorteadas = 0;
    if (qtdeBombas > linhas * colunas) {
      return;
    }
    while (sorteadas < qtdeBombas) {
      int i = Random().nextInt(_campo.length);
      if (_campo[i].minado) {
        sorteadas++;
        _campo[i].minar();
      }
    }
  }

  List<Campo> get campos {
    return _campo;
  }

  bool get resolvido {
    return _campo.every((element) => element.resolvido);
  }
}
