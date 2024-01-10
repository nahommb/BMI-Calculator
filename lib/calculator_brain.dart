import 'dart:math';
class calc_brain{
  final height;
  final weight;
  double bmi=0;
  int i;
  calc_brain(this.height,this.weight ,this.i);

  String culc_bmi(){
    bmi=weight/pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }
  String getresult(){
    if(i==1){
      if(bmi>=25){
        return "overweight";
      }
      else if(bmi>18.5){
        return "Normal";
      }
      else{
        return "Underweight";
      }
    }
    else{
      if(bmi>=22){
        return "Not bad";
      }
      else if(bmi>18.5){
        return "Normal";
      }
      else{
        return "Underweight";
      }
    }

  }
  String getinterpretatio(){
    if(i==1){
      if(bmi>=25){
        return "Go to GYM";
      }
      else if(bmi>18.5){
        return "Normal body, Good Job";
      }
      else{
        return "Eat more";
      }
    }
    else{
      if(bmi>=22){
        return "you need more exercise";
      }
      else if(bmi>18.5){
        return "keep it up";
      }
      else{
        return "Eat more";
      }
    }

  }



}