import 'package:flutter/material.dart';
class iconcontent extends StatelessWidget {
  IconData icontype;
  String gender;
  iconcontent(this.icontype,this.gender);

  @override
  Widget build(BuildContext context) {
    return Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icontype,size: 120,color: Colors.white,),
        Text(gender)
      ],
    );
  }
}