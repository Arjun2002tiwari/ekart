// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Product extends StatelessWidget {
  String category="";
  Product(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance.collection('Product').where('category',isEqualTo: category).snapshots(),
      builder:(context,snapshot){
        if(!snapshot.hasData){  
          return Center(
            child:CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          primary:true,
          itemCount:snapshot.data!.docs.length,
          itemBuilder:(context,index){
          QueryDocumentSnapshot x=snapshot.data!.docs[index];
          return ListTile(
            tileColor:Colors.blue[400],
            shape:RoundedRectangleBorder(
              side:BorderSide(color:Colors.white,width:1),
              borderRadius:BorderRadius.circular(5)
            ),

            title:Text(x['name'],style:TextStyle(fontSize:25,color:Colors.white,fontWeight:FontWeight.bold)),

            subtitle:Text('Brand:-${x['brand']}',style:TextStyle(fontSize:15,color:Colors.white,fontWeight:FontWeight.bold)),

          trailing:TextButton(
            onPressed: (){
            }, 
            child: Text('Price:-${x['price']} Rs/-',style:TextStyle(fontSize:15,color:Colors.white)),
          ),
          );
          },
          );
        });
  }
}