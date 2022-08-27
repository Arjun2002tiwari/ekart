// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:ekart/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant.dart';
import 'SellerInfo.dart';
import 'UserType.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                Text("Register now!",style:TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
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
                  bool val=await Database().signUp(email: email.text, password: pass.text);
                  if(val){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserType(email.text)));
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', email.text);
                  }
                }, 
                child: Text("Sign Up!",style:TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)),
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
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: Text("Sign In!",style:TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)),
                ),    
          ],),
        ),
      ),  
    )
    );
  }
}