import 'package:flutter/material.dart';

class CampoMinado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo Minado"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Tabuleiro"),
      ),
    );
  }
}
