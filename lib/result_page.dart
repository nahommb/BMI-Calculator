import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusablecode.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
class Result_page extends StatelessWidget {
  final String bmi_result;
  final String cond;
  final String interpertation_result;
  Result_page(this.bmi_result,this.cond,this.interpertation_result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CULCULATOR"),centerTitle: true,),
      body: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            //color: Colors.blue,
            child: Text("YOUR RESULT",style: bigtextstyle,textAlign:TextAlign.center,),
          ),
        ),
       Expanded(
         flex: 4,
           child: reusablecard(
         Color(0xFF003638),
         Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(cond.toUpperCase(),style: smalltextstyle,),
              Text(bmi_result,style: numberstyle,),
              Text(interpertation_result,style: smalltextstyle,)
            ],
         ),
           (){}
       )),
          GestureDetector(
            onTap: (){
            Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text("Re-CALCULATE",style: bigtextstyle,)),
              color: Color(0xFF29252C),
              height: 80,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
            ),
          )
        ],
      ),
    );
  }
}
