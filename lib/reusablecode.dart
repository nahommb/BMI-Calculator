import 'package:flutter/material.dart';
class reusablecard extends StatelessWidget {
  final Color kelem;
  final Widget cardchild;
  final Function onprss;
  reusablecard(this.kelem ,this.cardchild ,this.onprss);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onprss();},
      child: Container(
        //width: 130,
        //height: 150
        child: cardchild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: kelem,),
      ),
    );
  }
}