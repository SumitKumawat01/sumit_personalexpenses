

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);
  
  
   
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 450,
      child:transactions.isEmpty ?
      Column(
        children:[
        Text(
          'No transaction added yet!',
          style: TextStyle(fontSize:20),
        ),
        SizedBox(
          height: 10,
          ),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/wait.png',
            fit:BoxFit.cover,)
            ),
      ],
      )
       :ListView.builder(
        itemBuilder: (ctx,index) {
          return Card
          (
             elevation:5,
            margin: EdgeInsets.symmetric(
              vertical:8,
            horizontal: 5,  ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text('₹ ${transactions[index].amount}'),
                ),
            ),
              ),
              title: Text(
                transactions[index].title,
             style: Theme.of(context).textTheme.titleSmall,
              ),
            subtitle:Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ), 
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color:Colors.indigo,
                 onPressed:()=>deleteTx(transactions[index].id),
                 ),
            ),
          );      
        },
          itemCount: transactions.length,
      ),
             );
  }
}