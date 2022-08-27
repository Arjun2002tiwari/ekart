// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'CostumerInfo.dart';
import 'SellerHome.dart';
import 'SellerInfo.dart';

class UserType extends StatefulWidget {
  String Email="";
  UserType(this.Email, {Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height:double.infinity,
        width:double.infinity,
        decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage("Images/userType.jpg"),
            fit:BoxFit.cover,
          ),
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.black,
                    padding: EdgeInsets.all(15),
                    minimumSize: Size(130,50),
                  ),
              onPressed: ()async{
                final snapshot = await FirebaseFirestore.instance
                .collection('Seller').doc(widget.Email).collection('Bussiness').get();

                if ( snapshot.size == 0 ) {
                  print('it does not exist');
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SellerInfo(widget.Email)));
                }
                else{
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SellerHome(widget.Email)));
                }
              }, 
            child: Text('Seller',style:TextStyle(color:Colors.white,fontSize:20)),
            ),

            ElevatedButton(
              style:ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    padding: EdgeInsets.all(15),
                    minimumSize: Size(100,50),
                  ),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>CostumerInfo(widget.Email)));
              }, 
            child: Text('Customer',style:TextStyle(color:Colors.black,fontSize:20)),
            ),
          ]
        ),
      ),
    );
  }
}