import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekart/Constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Database{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    Future<bool> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("user registered successfully");
      return Future<bool>.value(true);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print("user not found!");
      return false;
    }
  }

  Future signOut() async {
    await _auth.signOut();
    print('signout');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }


  void AddSeller(String name,String category,String email,String phone){
    FirebaseFirestore.instance.collection('Seller').doc(email).collection('Bussiness').add({
      'Bussiness name': name,
      'category':category,
      'email':email,
      'phone':phone,
    });
    print('Seller Added Successfully!');
  }
  void AddProduct(String brand,String category,String name,int price ,String email){
    FirebaseFirestore.instance.collection('Seller').doc(email).collection('Product').add({
      'brand': brand,
      'category':category,
      'name':name,
      'price':price,
    });
    print("Product Added Successfully!");
  }
  void Product(String brand,String category,String name,int price,String email){
    FirebaseFirestore.instance.collection('Product').add({
      'brand': brand,
      'category':category,
      'name':name,
      'price':price,
      'email':email,
    });
  }

  void AddCustomer(String name,String city,String zip,DateTime age,String gender,String email){
    DateTime today=DateTime.now();
    FirebaseFirestore.instance.collection('Customer').doc(email).collection('Details').add({
      'name': name,
      'city':city,
      'zip':zip,
      'Age':today.year-age.year,
      'gender':gender,
      'email':email,
    });
    print('Customer Added Successfully!');
  }
}