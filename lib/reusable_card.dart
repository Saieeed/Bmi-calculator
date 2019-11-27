import 'package:flutter/material.dart';

class ReusableWidge extends StatelessWidget {
  ReusableWidge({@required this.colour, this.cardChild , this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap :onPress,
          child: Container(
          child: cardChild,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: colour,
          )
          ),
    );
  }
}