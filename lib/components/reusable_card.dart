import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onCardTap;

  ReusableCard(
      {@required this.color, @required this.child, @required this.onCardTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardTap();
      },
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: this.color,
        ),
      ),
    );
  }
}
