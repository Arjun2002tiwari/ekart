// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'AddProduct.dart';
import 'Database.dart';
import 'Login.dart';
import 'SellerProduct.dart';

class SellerHome extends StatefulWidget {
  String Email="";
  SellerHome(this.Email,{Key? key}) : super(key: key);

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[500],
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
        },
        child:Icon(Icons.add,color:Colors.white),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            SellerProduct(widget.Email),
        ]),
      ),
    );
  }
}
