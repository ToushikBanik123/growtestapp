import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growapp/register.dart';
import 'package:growapp/second.dart';
import 'package:growapp/utils/UserSimplePreferences.dart';

import 'api/constant.dart';


class HomePage extends StatefulWidget {
  final VoidCallback onClickedSignUp;


  const HomePage({Key? key, required this.onClickedSignUp }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(onClickedSignUp: () {  },),

    );
  }
}

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _passwordVisible  = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:Colors.orange[100],
          /*   image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
            ),*/
        ),
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
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80),
                        )),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    /*  decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                        BorderSide(color: Colors.grey.shade200)),
                                  ),*/
                                    child:  TextFormField(
                                      controller: _emailController,
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

                                      /* autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      validator: (email) =>
                                      email != null &&
                                          !EmailValidator.validate(email)
                                          ? 'Enter a valid email'
                                          : null,*/
                                    ),

                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: !_passwordVisible,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.orange[100],
                                        hintStyle: TextStyle( fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontSize: 16,),
                                        hintText: 'Enter Phone No.',
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

                                      autovalidateMode: AutovalidateMode
                                          .onUserInteraction,
                                      validator: (value) =>
                                      value != null && value.length < 6
                                          ? 'Enter min. 6 characters'
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {}/*Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ForgotPassword())),*/,
                                    child: Text(
                                      "Forgot Password ?",textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.blue,
                                        fontSize: 15,),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "/ ",
                                    style: TextStyle(color: Colors.blue, fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Register()));
                                    },child: Text(
                                    "Create Account",
                                    style: TextStyle(color: Colors.blue, fontSize: 15),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SecondPage()),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 200,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
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