// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekart/Constant.dart';
import 'package:ekart/Database.dart';
import 'package:ekart/SellerHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CostumerHome.dart';
import 'SignUp.dart';
import 'UserType.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue,Colors.greenAccent, Colors.pinkAccent],
          ),
        ),
        child:Center(
          child:Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Text("Login now!",style:TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
                SizedBox(height: 20,),

                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                fillColor:Colors.white,
                filled:true,
                //errorText: _name==null?null:_name,
                hintStyle: TextStyle(fontSize: 20,color:Colors.blue,fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height:20,
            ),
            TextField(
                  controller: pass,
                  keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Password",
                fillColor:Colors.white,
                filled:true,
                //errorText: _name==null?null:_name,
                hintStyle: TextStyle(fontSize: 20,color:Colors.blue,fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(
              height:20,
            ),
            ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    padding: EdgeInsets.all(15),
                    minimumSize: Size(double.infinity,60),
                  ),
                onPressed: () async {
                  bool val=await Database().signIn(email: email.text, password: pass.text);
                  if(val){
                  final snapshot = await FirebaseFirestore.instance
    .collection('Seller').doc(email.text).collection('Bussiness').get();
    if ( snapshot.size == 0 ) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CostumerHome(email.text))); 
    }
    else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SellerHome(email.text)));
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email.text);
    }
                }, 
                child: Text("Login In!",style:TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height:10,
                ),
                Text('New User?',style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold),),
                SizedBox(
                  height:10,
                ),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.white,
                    padding: EdgeInsets.all(15),
                    minimumSize: Size(double.infinity,60),
                  ),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                }, 
                child: Text("Sign Up!",style:TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)),
                ),         
          ],),
        ),
      ),  
    )
    );
  }
}