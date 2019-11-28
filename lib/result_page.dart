import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/sumit_button.dart';
import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'calculations.dart';
class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    calculate c = new calculate() ;
    return Scaffold(
      appBar: AppBar(
        title:Text('Results' ,
        textAlign: TextAlign.center,),


      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
                child: Text('Your Result' ,
                style:kResultTextStyle),
            ),
          ),
          Expanded(
            flex:5,
            child: ReusableWidge(
              cardChild: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(c.health(), textAlign: TextAlign.center,
                         style: kResultTextStyle2,),
                  Text(c.getWeight().floor().toString(),textAlign: TextAlign.center,
                       style : kResultTextStyle3 ,),
                  Text(c.title() , textAlign: TextAlign.center,
                       style: kResultTextStyle2,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 100.0,
                      height: 120.0,
                      child:
                      submit_button(onPressed: (){
                        Navigator.pop(context);
                      },text: 'ReCalculate',),
                      ),
                    )


                ],
              ),
              colour:kActivecolor ,

            ),
          ),

        ],
      ) ,



    );
  }
}
