import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'api/fetchApi.dart';
import 'otp verification.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  static final RegExp nameRegExp = RegExp('[a-zA-Z ]{2,10}');
  String? dropdownValue="18";
  bool click=false;

  @override
  void initState() {
    dropdownValue="18";

    // getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:Colors.orange[100],
          /* image: DecorationImage(
            image: AssetImage("assets/images/bg.jpeg"),
            fit: BoxFit.cover,
          ),*/),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset("assets/images/bg1.png"),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),Form(key:formkey,
              child:
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    /*  decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                        BorderSide(color: Colors.grey.shade200)),
                                  ),*/
                                    child:  TextFormField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.orange[100],
                                        hintStyle: TextStyle( fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontSize: 16,),
                                        hintText: 'Enter Name',
                                        contentPadding:
                                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0x00000000)),
                                          borderRadius: BorderRadius.circular(25.7),),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0x00000000)),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0x00000000)),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        focusedErrorBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0x00000000)),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '*required';
                                        }
                                        else if(!nameRegExp.hasMatch(value))
                                        {
                                          return 'Only alphabet allowed';
                                        }
                                        return null;
                                      },
                                    ),),
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: _phoneController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.orange[100],
                                        hintStyle: TextStyle( fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontSize: 16,),
                                        hintText: 'Enter Phone',
                                        contentPadding:
                                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0x00000000)),
                                          borderRadius: BorderRadius.circular(25.7),),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0x00000000)),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0x00000000)),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        focusedErrorBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0x00000000)),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '*required';
                                        }
                                        else if(value.length!=10)
                                        {
                                          return 'Enter 10 digit valid mobile number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 275,
                              decoration: BoxDecoration(
                                color:Colors.orange[100],
                                border: Border.all(color: Color(0x00000000)),
                                borderRadius: BorderRadius.circular(25.7),),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('   Select Age :         ',
                                    style: TextStyle(fontSize: 18.sp,),
                                  ),
                                  Container(
                                    width:70,
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      hint:Text("18"),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: ['18', '19','20','21','22','23','24','25','+25',].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              '(Note – minimum age is 18 for registration)',
                              style: TextStyle(fontSize: 13.sp,color:Colors.red),
                            ),
                            SizedBox(height: 20.0.h),
                            GestureDetector(
                              onTap: () async {
                                if (formkey.currentState!.validate()) {
                                  Future<bool> flag = fetchApi().Register(
                                      _nameController.text,
                                      _phoneController.text,
                                      dropdownValue.toString());
                                  if (await flag == true) {
                                    print("success");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => OTP()),
                                    );
                                  } else {
                                    print("error");
                                  }
                                }
                              },

                              child: Container(
                                height: 50,
                                width: 200,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Create Account",
                                    style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),),
          ],
        ),
      ),
    );
  }
}