// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Database.dart';
import 'Login.dart';
import 'Product.dart';

class CostumerHome extends StatefulWidget {
  String email="";
  CostumerHome(this.email,{Key? key}) : super(key: key);

  @override
  State<CostumerHome> createState() => _CostumerHomeState();
}

class _CostumerHomeState extends State<CostumerHome> {
  String Dvalue="Electronics";
   var items = [   
    'Electronics',
    'Accessories',
    'Fashion',
    'Grocceries',
    'Kids',
    'Household',
    'Men',
    'Women',
  ];
  var category="";
  void initState() {
    super.initState();
    category=Dvalue;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Your Products',style:TextStyle(color:Colors.white,fontSize:30)),
        backgroundColor: Colors.blue[600],
        actions: [
          IconButton(onPressed: (){
            Database().signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
          }, 
          icon:Icon(Icons.logout),
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children:[
                Padding(
                  padding:EdgeInsets.all(10), 
                ),
                Text("Apply Filter:",style:TextStyle(fontSize:20,color:Colors.redAccent,fontWeight:FontWeight.bold,)),
                SizedBox(
                  width:20,
                ),
            DropdownButton(
                  value:Dvalue,
                  icon:Icon(Icons.keyboard_arrow_down), 
                  items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  Dvalue = newValue!;
                  category=Dvalue;
                });
              },),],
            ),
            
            Product(category),
        ]),
      ),
    );
  }
}