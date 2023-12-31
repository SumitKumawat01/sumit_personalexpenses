import 'package:flutter/material.dart';


class Chartbar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctofTotal;

  Chartbar(this.label,this.spendingAmount,this.spendingPctofTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 20,
        child: FittedBox(
          child: Text('₹' +spendingAmount.toStringAsFixed(0)))),
      SizedBox(height: 4,),
      Container(
        height: 60,
        width:10,
      child:Stack(
        children:[
          Container(
            decoration:BoxDecoration(
              border: Border.all(color: Colors.black,width: 1.0),
              color: Color.fromRGBO(201,237,237,1),
              borderRadius:BorderRadius.circular(5),
            ),),
            FractionallySizedBox(
              heightFactor: spendingPctofTotal,
              child: Container(
                decoration:BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            )
        ]
      )
      ),
      SizedBox(
        height: 4,
      ),
      Text(label),
    ],
    );
  }
}