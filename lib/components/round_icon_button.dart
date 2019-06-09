import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RawMaterialButton(
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        child: Icon(this.icon),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
