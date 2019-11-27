import 'package:flutter/material.dart';
import 'constants.dart';
class CardView extends StatelessWidget {
  CardView({@required  this.x , @required this.y});
  final IconData x ; 
  final String y ; 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          x,
          size: 50.0,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          y,
          style:kTextstyle ,
        )
      ],
    );
  }
}
