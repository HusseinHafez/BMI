import 'dart:math';

class BmiController {
  double tall = 150.0;
  int age = 20;
  int weight = 70;
  bool isActiveMale = false;
  bool isActiveFemale = false;
  double? result;

/*  IconData submittedIconGender() {
    if (isActiveMale && !isActiveFemale) {
      return Icons.man;
    } else {
      return Icons.woman;
    }
  }*/
  double? getResult( int weight, double tall){
    result=(weight/pow((tall/100),2));
    return  result;
  }
  String getResultState(){
    if(result!<18){
      return 'Under Weight';
    }else if(18<result!&&result!<24.9){
      return 'Normal';
    }else if(25<result!&&result!<29.9){
      return 'Over Weight';
    }else if(30<result!&&result!<34.9){
      return 'Obese';
    }else{
      return 'Extremely Obese';
    }
  }
  String getText(){
    if(getResultState()=='Under Weight'){
      return 'Should to eat more for good health ';
    }else if(getResultState()=='Normal'){
      return 'that\'s good for your health take care of your health';
    }else if(getResultState()=='Over Weight'){
      return 'Do some exercise to be fit';
    }else if(getResultState()=='Obese'){
      return 'Should eat less and Do exercise to be fit';
    }else{
      return 'Don\'t stop try to be better ';
    }
  }
}