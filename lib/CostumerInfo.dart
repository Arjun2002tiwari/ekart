// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CostumerInfo extends StatefulWidget {
  String email="";
  CostumerInfo(this.email,{Key? key}) : super(key: key);

  @override
  State<CostumerInfo> createState() => _CostumerInfoState();
}

class _CostumerInfoState extends State<CostumerInfo> {
  TextEditingController name=TextEditingController();
  TextEditingController city=TextEditingController();
  TextEditingController zip=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController gender=TextEditingController();
  TextEditingController email=TextEditingController();

  
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
              child:Text("Enter Your Details",style:TextStyle(color:Colors.blue[800],fontSize:30,fontWeight:FontWeight.bold)
              ),
            ),
            SizedBox(
              height:50,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Your Name",
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
            controller: city,
              decoration: InputDecoration(
                labelText: "city name",
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
            controller: age,
              decoration: InputDecoration(
                labelText: "Date of birth",
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
            controller:gender,
              decoration: InputDecoration(
                labelText: "Gender",
                 errorText: _phone==null?null:_phone,
                labelStyle: TextStyle(fontSize: 20,color:Colors.pink[800],fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height:30,
            ),
            TextField(
            controller: email,
              decoration: InputDecoration(
                labelText: "email",
                labelStyle: TextStyle(fontSize: 20,color:Colors.pink[800],fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
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