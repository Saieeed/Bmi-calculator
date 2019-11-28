import 'input_page.dart';

class calculate {
  double _bestWeight;


     calculate() {
    if (gendertype == Gender.male) {
      _bestWeight = 50 + (0.91 * (number - 152.4));
    } else {
      _bestWeight = 45.5 + (0.91 * (number - 152.4));
    }
  }

  String health(){
    return _bestWeight < weight ? 'You are Fat ' : 'Maybe You are in a good shape' ;
  }
  bool checkWeight(){
       if(_bestWeight < weight ) {
         return false;
       }
       else if(_bestWeight >= weight)
          return true ;
  }
  double getWeight(){

       return _bestWeight < weight ?  (weight-_bestWeight) : (_bestWeight-weight) ;
  }
  String title (){
      double  w = 0 ;
       if( checkWeight()== true ){
        w = _bestWeight - weight ;
      return 'You need to gain  ${w.floor()} Kg and your weight is '
          '${weight} ';
       }
       else if (checkWeight() ==false) {
         w = (weight - _bestWeight ) ;
         return 'You need to  lose ${w.floor()}  Kg  and your weight is '
             '${weight} '
             ;
       }
  }
}