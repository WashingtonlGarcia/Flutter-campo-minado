import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';

class CampoMinado extends StatelessWidget {
  _reniciar() {
    print("reniciar");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultadoWidget(venceu: true, onReniciar: _reniciar),
      body: Center(
        child: Text("Tabuleiro"),
      ),
    );
  }
}
