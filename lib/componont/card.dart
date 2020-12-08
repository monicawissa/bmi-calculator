import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.coulor, this.card, this.onpress});
  final Widget card;
  final Color coulor;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: card,
        height: 200,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: coulor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
