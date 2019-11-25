import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart' show ReusableWidge;
import 'Icon_card.dart' show CardView;
import 'constants.dart';

Gender gendertype;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Widget star(BuildContext context) {
  return AlertDialog(
                    title: Text("the best weight for you is ") ,
                      content: Text(bestweight.toString()),

                          ) ;
}

int number = 130;
int weight = 60 ;
int age = 20 ;
double bestweight ;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableWidge(
                    onPress: () {
                      setState(() {
                        gendertype = Gender.male;
                      });
                    },
                    colour: gendertype == Gender.male
                        ? kInactivecolor
                        : kActivecolor,
                    cardChild: CardView(
                      x: FontAwesomeIcons.mars,
                      y: "Male",
                    ),
                  )),
                  Expanded(
                    child: ReusableWidge(
                      onPress: () {
                        setState(() {
                          gendertype = Gender.female;
                        });
                      },
                      colour: gendertype == Gender.female
                          ? kInactivecolor
                          : kActivecolor,
                      cardChild: CardView(
                        x: FontAwesomeIcons.venus,
                        y: "DishWasher",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ReusableWidge(
              colour: kActivecolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        number.toString(),
                        style: kTextstyle2,
                      ),
                      Text(
                        'cm',
                        style: kTextstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.grey,
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.pink,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      onChanged: (double n) {
                        setState(() {
                          number = n.round();
                        });
                      },
                      value: number.toDouble(),
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child:
                   ReusableWidge(colour: kActivecolor,
                   cardChild:Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:
                    <Widget>[
                          Text('WEIGHT',style: kTextstyle,),
                          Text(weight.toString() , style: kTextstyle2,),
                          
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onpressed: (){
                                    setState(() {
                                      weight++;
                                    });

                            },),
                            SizedBox(
                              width:5.0,
                              height:5.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState(() {
                               weight--; 
                              });
                            },),
                          ],),  
                          


                   ],),
                   )),
                  Expanded(child: ReusableWidge(colour: kActivecolor,
                  cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',style: kTextstyle),
                    Text(age.toString(), style: kTextstyle2,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onpressed: (){
                                    setState(() {
                                     age++;
                                    });

                            },),
                            SizedBox(
                              width:5.0,
                              height:5.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState(() {
                               age--;
                              });
                            },),
                          ],)

                  ],
                  ),
                  ))
                ],
              ),
            ),
            FlatButton(
              onPressed: (){
                if(gendertype==Gender.male){
                  bestweight = 50 +(0.91 *  (number - 152.4)) ;
                }
                else {
                  bestweight = 45.5 +(0.91 *  (number - 152.4)) ;
                }
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AlertDialog(
                    title: Text("the best weight for you is ") ,
                      content: Text(bestweight.toString()),

                          ) ;
                })) ;
                  //print(bestweight);
              },
              child:
              Text('Calculate'),
              padding:  EdgeInsets.all(50.0),
              color: Colors.pink,

            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({ @required this.icon , @required   this.onpressed});
  final IconData icon  ;
  final Function onpressed ;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon) ,
      elevation: 1.0,
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}

