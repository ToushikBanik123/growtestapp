import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../model/RegisterModel.dart';
import '../utils/UserSimplePreferences.dart';
import 'constant.dart';

class fetchApi extends StatefulWidget {
  bool noDataFound = false;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  static List<RegisterModel> list = [];

  Future<bool>  Register(String name,String phone,String age) async {
    //bool result=false;
    final res = await http.post(
        Uri.parse("https://barishloan.in/Bramhin/API/register.php"),
        body: <String, String>{
          'name':name,
          'phone': phone,
          'age' :age,
        });
    List lst;
    print("responce "+ res.toString());
    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if (data["error"]) {
        String d = data["message"];
        UserSimplePreferences.init();
        UserSimplePreferences.setPhone(phone.toString());
        UserSimplePreferences.getPhone();
        Fluttertoast.showToast(msg: "$d");
        Fluttertoast.showToast(msg: Constant.phone.toString() );
        //true;
        print("error occurred");
        return true;
      }
      else
      {
        String d = data["message"];
        Fluttertoast.showToast(msg: "$d");
        return false;
      }
    }
    return false;
  }

  //insert second page data

  Future<bool>  SecondPage(String name,String lname,String fname,String email,String gotra, String gender,String address,String area, String pincode, String city,String dist,String state,String country,String marital, String about) async {
    bool result=false;
    final res = await http.post(
        Uri.parse("https://barishloan.in/Bramhin/API/secondPage.php"),
        body: <String, String>{
          'name':name,
          'lname': lname,
          'fname' :fname,
          'email':email,
          'gotra': gotra,
          'gender' :gender,
          'area':area,
          'pincode': pincode,
          'address' :address,
          'city':city,
          'state': state,
          'dist' :dist,
          'country':country,
          'marital': marital,
          'about' :about,
        });
    List lst;
    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if (data["error"]) {
        String d = data["message"];
        Fluttertoast.showToast(msg: "$d");

        /*  for (int i = 0; i < lst.length; i++) {
          Map<String, dynamic> json = lst[i];
          list.add(RegisterModel(
              id: json['id'],
              name: json['name'],
              phone: json['phone'],
          ));
        }*/
        true;
        print("error occurred");
        result= true;
      }
      else
      {
        String d = data["message"];
        Fluttertoast.showToast(msg: "$d");
        result=false;
      }
    }
    return result;
  }
  //-------------------------fetchuser

  Future<void>  fetchProfileData(String phone) async {
// String? id = UserSimplePreferences.getID() != null? UserSimplePreferences.getID().toString():"";
    final res = await http.post(
        Uri.parse("https://thetechnicalsolution.in/AICS/Api/Register.php"),
        body: <String, String>{
          'phone': phone,
        });
    List lst;
    if (res.statusCode == 200) {
      print(res.body); //print raw response on console
      var data = json.decode(res.body); //decoding json to array
      if (data["error"]) {
        lst = data["message"];
        for (int i = 0; i < lst.length; i++) {
          Map<String, dynamic> json = lst[i];
          list.add(RegisterModel(
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
          ));
        }
        true;
        print("error occurred");
      }
    }
  }
}
