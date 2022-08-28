// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'CostumerHome.dart';
import 'Database.dart';

class CostumerInfo extends StatefulWidget {
  String email="";
  CostumerInfo(this.email,{Key? key}) : super(key: key);

  @override
  State<CostumerInfo> createState() => _CostumerInfoState();
}

class _CostumerInfoState extends State<CostumerInfo> {
  DateTime today=DateTime.now();
  TextEditingController name=TextEditingController();
  TextEditingController city=TextEditingController();
  TextEditingController zip=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController gender=TextEditingController();
  TextEditingController email=TextEditingController();

  var _name;
  var _city;
  var _pin;
  var _age;
  var _gender;
  var _email;

  void initState() {
    super.initState();
    age.text='${today.day}-${today.month}-${today.year}';
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
                 errorText: _city==null?null:_city,
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
              controller: zip,
              decoration: InputDecoration(
                labelText: "Your pin code",
                errorText: _pin==null?null:_pin,
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
                suffixIcon: IconButton(
                  icon:Icon(Icons.calendar_today),
                  onPressed:(){
                    selectDate(context);
                  },
                ),
                labelText: "DOB",
                errorText: _age==null?null:_age,
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
                 errorText: _gender==null?null:_gender,
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
                errorText: _email==null?null:_email,
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
                        city.text == '' ||
                        zip.text == '' ||
                        age.text=='' ||
                        gender.text=='' ||
                        email.text=='') {
                      if (name.text == '') {
                        setState(() {
                          _name = 'name is required';
                        });
                      } else if (city.text == '') {
                        setState(() {
                          _city= 'City is required';
                        });
                      } else if (zip.text == '') {
                        setState(() {
                          _pin = 'pin code is required';
                        });
                      }
                      else if (age.text == '') {
                        setState(() {
                          _age = 'DOB is required';
                        });
                      }
                      else if (gender.text == '') {
                        setState(() {
                          _gender = 'gender is required';
                        });
                      }
                      else if (email.text == '') {
                        setState(() {
                          _email = 'email is required';
                        });
                      }
                    } else {
                      setState(() {
                        _name=null;
                        _city=null;
                        _pin=null;
                        _age=null;
                        _gender=null;
                        _email=null;
                      }); 
                  Database().AddCustomer(name.text, city.text, zip.text, today,gender.text,email.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CostumerHome(email.text)));
                  }
                }, 
                child: Text("Register Now!",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                ),      
          ],
        ),
      ),
    );
  }
  Future<void> selectDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),);

    if(pickedDate!=null && pickedDate!=today){
      setState(() {
        today=pickedDate;
        age.text='${today.day}-${today.month}-${today.year}';
      });
    }
  }
}
