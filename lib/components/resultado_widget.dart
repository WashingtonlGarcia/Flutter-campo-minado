import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool venceu;
  final Function onReniciar;

  ResultadoWidget({
    @required this.venceu,
    @required this.onReniciar,
  });

  Color _getColor() {
    if (venceu == null) {
      return Colors.yellow;
    }
    if (venceu) {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData _getIcon() {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    }
    if (venceu) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: _getColor(),
                    child: Icon(
                      _getIcon(),
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    " Campo minado",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: onReniciar,
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
