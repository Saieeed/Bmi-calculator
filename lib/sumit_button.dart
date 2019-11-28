import 'package:flutter/material.dart';

class submit_button extends StatelessWidget {
  submit_button({@required this.onPressed , @required this.text});
  final  onPressed ;
  final  text ;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      // shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(90.0)),
      onPressed: this.onPressed,
        child: Text(this.text),
        padding: EdgeInsets.all(50.0),
        color: Colors.pink,
      );
  }
}

