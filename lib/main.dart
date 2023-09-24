import 'package:flutter/material.dart';
import './models/widgets/new_transaction.dart';
import './models/widgets/transaction_list.dart';
import './models/transaction.dart';
import './models/widgets/chart.dart';
import'package:second_project/models/widgets/chart.dart';




void main()=>runApp(PersonalExpenses());

class PersonalExpenses extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        accentColor: Colors.deepPurpleAccent),
        home:MyHomePage(),
      ); 
  }
}

class MyHomePage extends StatefulWidget {  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction>transaction=[];
       final List<Transaction>_userTransactions=[];
   

List<Transaction>get _recentTransactions{
  return _userTransactions.where((tx){
    return tx.date.isAfter(
      DateTime.now().subtract(
      Duration(days: 7),
    ),
    );
  }).toList();
  }
    
 void _addNewTransaction(
    double txAmount, DateTime choosenDate, String txTitle) {
    final newTx =
        // ignore: unnecessary_cast
        Transaction(DateTime.now().toString(), txAmount as double , choosenDate as DateTime , txTitle);


         setState(() {
            _userTransactions.add(newTx);
          });
      }
   void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }
  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx){
        return tx.id==id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
title: Text('Personal expenses'),
actions:[
IconButton(
   
onPressed: ()=>_startAddNewTransaction(context),
icon: Icon(Icons.add),
),
],
      ),
      body: SingleChildScrollView (
       child: Column(
       //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.stretch ,
        children:[
       Chart(_recentTransactions),
       TransactionList(_userTransactions,_deleteTransaction),
        
        ],
      ),     
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    floatingActionButton: FloatingActionButton(
      child:Icon(Icons.add_box),
      onPressed: ()=>_startAddNewTransaction(context),
    ),
    );
   
  }
      }
