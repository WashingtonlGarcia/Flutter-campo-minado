import 'package:campoMinado/components/campo_widget.dart';
import 'package:campoMinado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final Function onAbrir;
  final Function onAlternarMarcacao;
  TabuleiroWidget({
    @required @required this.tabuleiro,
    @required this.onAbrir,
    @required this.onAlternarMarcacao,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((e) {
          return CampoWidget(
            campo: e,
            onAbrir: onAbrir,
            onAlternarMarcacao: onAlternarMarcacao,
          );
        }).toList(),
      ),
    );
  }
}
