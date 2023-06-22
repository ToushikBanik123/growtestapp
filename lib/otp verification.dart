import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growapp/second.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: _body(context),
      ),),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: <Widget>[
        _headerImage(),
        Container(
          child: _boxWithLable(context),
        ),
        SizedBox(height: 20,),
        _bottomButton(context)
      ],
    );
  }

  Widget _boxWithLable(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text("Enter OTP:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black
                )
            )
        ),
        SizedBox(height: 10,),
        _boxBuilder()
      ],
    );
  }

  Widget _boxBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _box(),
        _box(),
        _box(),
        _box(),
      ],
    );
  }

  Widget _box() {
    return Container(
      height:60,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      alignment: Alignment.center,
      // height: MediaQuery.of(context).size.height / 14,
      //  height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery
          .of(context)
          .size
          .width / 8,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
            contentPadding: const EdgeInsets.all(20)
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orangeAccent, width: 2)),
    );
  }

  Widget _headerImage() {
    return Container(
        padding: const EdgeInsets.only(top: 50),
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child:
        Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", fit: BoxFit.cover, height: 160, ),
            Container(
              width: 300,
              child: Text(
                'Enter 4 digit otp send to your registered \n mobile number',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.sp,color:Colors.grey),
              ),
            ),
          ],)
    );
  }

  Widget _bottomButton(BuildContext context) {
    return Container(
      // alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              alignment: Alignment.center,
              height: MediaQuery .of(context)
                  .size
                  .height / 15,
              child: Text("Submit", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange)),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}