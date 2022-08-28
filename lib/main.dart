// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekart/SellerHome.dart';
import 'package:ekart/UserType.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'HomeScreen.dart'; 
import 'CostumerHome.dart';
import 'Login.dart';
import 'SellerInfo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');

  //var photo = prefs.getString('photo');
    if(email==null){
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
  else{
    final snapshot = await FirebaseFirestore.instance
    .collection('Seller').doc(email).collection('Bussiness').get();
    if ( snapshot.size == 0 ) {
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home:CostumerHome(email),
        ),
      );    
    }
    else{
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home:SellerHome(email),
        ),
      ); 
    }
  }
  }
