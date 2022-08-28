// ignore_for_file: prefer_const_constructors

import 'package:ekart/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddProduct extends StatefulWidget {
  String Email="";
  AddProduct(this.Email,{Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController brand=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController price=TextEditingController();
   var _name;
   var _cat;
   var _price;
   var _brand;
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
  void initState() {
    super.initState();
    category.text=Dvalue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Add Your Product',style:TextStyle(fontSize:30)),
        backgroundColor: Colors.blue,
      ),
      body:ListView(
          padding: EdgeInsets.all(20),
          children:[
            SizedBox(
              height:60,
            ),
            Center(
              child:Text("Enter Product Details",style:TextStyle(color:Colors.blue[800],fontSize:30,fontWeight:FontWeight.bold)
              ),
            ),
            SizedBox(
              height:50,
            ),
            TextField(
              controller: brand,
              decoration: InputDecoration(
                labelText: "Brand",
                errorText: _brand==null?null:_brand,
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
                suffixIcon: DropdownButton(
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
                  category.text=Dvalue;
                });
              },),
                labelText: "Category",
                 errorText: _cat==null?null:_cat,
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
            controller: name,
              decoration: InputDecoration(
                labelText: "Name",
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
            controller:price,
              decoration: InputDecoration(
                labelText: "Price",
                 errorText: _price==null?null:_price,
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
                        price.text == '' || brand.text=='') {
                      if (brand.text == '') {
                        setState(() {
                          _brand = 'Brand name is required';
                        });
                      } else if (category.text == '') {
                        setState(() {
                          _cat = 'Category is required';
                        });
                      } else if (name.text == '') {
                        setState(() {
                          _name = 'Product Name is required';
                        });
                      }
                      else if (price.text == '') {
                        setState(() {
                          _price = 'Price is required';
                        });
                      }
                    } else {
                      setState(() {
                        _name = null;
                        _cat = null;
                        _price = null;
                        _brand=null;
                      }); 
                    Database().AddProduct(brand.text, category.text, name.text,int.parse(price.text),widget.Email);
                    Database().Product(brand.text, category.text, name.text, int.parse(price.text),widget.Email);
                    Navigator.pop(context);
                  }
                }, 
                child: Text("Add Product!",style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                ),      
          ],
        ),
    );
  }
}