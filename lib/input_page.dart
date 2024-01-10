import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'icons.dart';
import 'reusablecode.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculator_brain.dart';


enum Gender{
  male,
  female
}
int height =180;
double sliderradius=12;
double slideroverlay=25;
int weight=60;
int age=18;
int parity=0;
class inputpage extends StatefulWidget {
  const inputpage({Key? key}) : super(key: key);

  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {

  Color malecolor=cardcolor;
  Color femalcolor=cardcolor;
 // like int i we use Gender s
  void updatecolor(Gender s){
    if(s==Gender.male){
      if(malecolor==cardcolor){
        malecolor=pressdcardcolor;
        femalcolor=cardcolor;
      }
      else{
        malecolor=cardcolor;
      }
    }
    else{
      if(femalcolor==cardcolor){
        femalcolor=pressdcardcolor;
        malecolor=cardcolor;
      }
      else{
        femalcolor=cardcolor;
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body:Column(children: [
        Expanded(child: Row(
          children: [
            Expanded(child:
            reusablecard(malecolor,iconcontent(Icons.boy,"MALE"),(){
              setState(() {
                parity=1;
                updatecolor(Gender.male);
              });
            }),),
            Expanded(child:
            reusablecard(femalcolor,iconcontent(Icons.girl,"FEMALE"),(){
              parity=0;
              setState(() {
                updatecolor(Gender.female);
              });
            }),),
          ],
        )),
        Expanded(child: reusablecard(cardcolor,Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Height"),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(height.toString() , style: numberstyle,),
                Text("cm")
              ],
            ),
            SliderTheme(data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color(0xFF7ECA9C),
              inactiveTrackColor: Colors.white,
              thumbColor: Colors.green,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: sliderradius),
              overlayShape: RoundSliderOverlayShape(overlayRadius: slideroverlay)
            ),
              child: Slider(
                  value:height.toDouble() ,
                  min: 100,
                  max: 200,
                  onChanged: (double x){
                    setState(() {
                      sliderradius=20;
                      slideroverlay=30;
                      height=x.toInt();
                    });
                  },
                onChangeEnd: (double z){
                    setState(() {
                      sliderradius=12;
                      slideroverlay=25;
                    });
                },
              ),
            )
          ],
        ),(){}),),
        Expanded(child: Row(
          children: [
            Expanded(child: reusablecard(
                cardcolor,
                Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Weight",),
                    Text(weight.toString(),style: numberstyle,),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundiconbutton(Icons.minimize,(){
                            setState(() {
                              weight--;
                            });
                          }),
                          SizedBox(width: 10,),
                          roundiconbutton(Icons.add,(){
                             setState(() {
                               weight++;
                            });
                    }),
                    ]
                    )
                  ],
                ),
                    (){}),),
            Expanded(child:reusablecard(
                cardcolor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Age",),
                    Text(age.toString(),style: numberstyle,),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundiconbutton(Icons.minimize,(){
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(width: 10,),
                          roundiconbutton(Icons.add,(){
                            setState(() {
                              age++;
                            });
                          }),
                        ]
                    )
                  ],
                ),
                    (){}),),
          ],
        )),
        GestureDetector(
          onTap: (){
            calc_brain calc=calc_brain(height, weight,parity);
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Result_page(
                  calc.culc_bmi(),
                  calc.getresult(),
                  calc.getinterpretatio()
                )));
          },
          child: Container(
            child: Center(child: Text("CALCULATE",style: bigtextstyle,)),
            color: Color(0xFF29252C),
            height: 80,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
          ),
        )
      ],),
    );
  }
}
class roundiconbutton extends StatelessWidget {
  final IconData roundic;
  final Function prsd;
   roundiconbutton(@required this.roundic ,this.prsd);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: (){prsd();},
        child: Icon (roundic,color: Colors.white,),
        shape: RoundedRectangleBorder(),
      fillColor: Color(0xFF03506F),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50
      ),
    );
  }
}





