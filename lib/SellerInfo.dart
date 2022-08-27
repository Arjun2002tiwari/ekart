// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Database.dart';
import 'SellerHome.dart';

class SellerInfo extends StatefulWidget {
  String Email="";
  SellerInfo(this.Email,{Key? key}) : super(key: key);

  @override
  State<SellerInfo> createState() => _SellerInfoState();
}

class _SellerInfoState extends State<SellerInfo> {
  TextEditingController name=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
   var _name;
   var _cat;
   var _phone;
   Database database=new Database();

  @override
  void initState() {
    super.initState();
    email.text=widget.Email;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height:double.infinity,
        width:double.infinity,
        decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage("Images/userback.png"),
            fit:BoxFit.cover,
          ),
        ),
        child:ListView(
          padding: EdgeInsets.all(20),
          children:[
            SizedBox(
              height:60,
            ),
            Center(
              child:Text("Enter Bussiness Details",style:TextStyle(color:Colors.blue[800],fontSize:30,fontWeight:FontWeight.bold)
              ),
            ),
            SizedBox(
              height:50,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Buissness Name",
                errorText: _name==null?null:_name,
                labelStyle: TextStyle(fontSize: 20,color:Colors.pink[800],fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height:30
            ),
          TextField(
            controller: category,
              decoration: InputDecoration(
                labelText: "Buissness Category",
                 errorText: _cat==null?null:_cat,
                labelStyle: TextStyle(fontSize: 20,color:Colors.pink[800],fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height:30
            ),
          TextField(
            controller: email,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 20,color:Colors.pink[800],fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              readOnly: true,
            ),
            SizedBox(
              height:30
            ),
          TextField(
            controller:phone,
              decoration: InputDecoration(
                labelText: "Phone",
                 errorText: _phone==null?null:_phone,
                labelStyle: TextStyle(fontSize: 20,color:Colors.pink[800],fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              maxLength:10,
            ),
            SizedBox(
              height:40,
            ),
            ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.blue,
                    padding: EdgeInsets.all(15),
                    minimumSize: Size(double.infinity,50),
                  ),
                onPressed: () {
                  if (name.text == '' ||
                        category.text == '' ||
                        phone.text == '') {
                      if (name.text == '') {
                        setState(() {
                          _name = 'Bussiness name is required';
                        });
                      } else if (category.text == '') {
                        setState(() {
                          _cat = 'Category is required';
                        });
                      } else if (phone.text == '') {
                        setState(() {
                          _phone = 'phone number is required';
                        });
                      }
                    } else {
                      setState(() {
                        _name = null;
                        _cat = null;
                        _phone = null;
                      }); 
                  database.AddSeller(name.text, category.text, email.text, phone.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SellerHome(widget.Email)));
                  }
                }, 
                child: Text("Register Now!",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                ),      
          ],
        ),
      ),
    );
  }
}