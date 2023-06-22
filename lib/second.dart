import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growapp/second.dart';
import 'package:growapp/second.dart';
import 'package:growapp/third.dart';
import 'package:growapp/utils/UserSimplePreferences.dart';
import 'api/fetchApi.dart';
import 'color.dart';
import 'package:http/http.dart' as http;



class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _fathernameController = TextEditingController();
  TextEditingController _dorrController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  static final RegExp nameRegExp = RegExp('[a-zA-Z ]{2,10}');
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int _bottomBarIndex = 0;

  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  String? dropdownValue;
  String? selectedStatus;
  String? selecteGautra;
  String? selecteGender;
  String? selecteCity;
  String? selecteDist;
  String? selecteState;
  String? selecteCountry;

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _handleTextChanged(int index, String value) {
    if (value.isNotEmpty && index < _controllers.length - 1) {
      FocusScope.of(context).nextFocus();
    }
  }




  @override
  void initState() {
    // dropdownValue="18";
    selectedStatus = "Unmarried";
    // getImages();
  }

  void getPhone() {
    print("Get the phone ${UserSimplePreferences.getPhone()}");
  }


  Future<bool> callPhiApi() async {
    var url = Uri.parse('https://barishloan.in/Bramhin/API/secondPage.php');

    var response = await http.post(url, body: {
      'phone': UserSimplePreferences.getPhone(),
      'name': _nameController.text,
      'lname': _surnameController.text,
      'fname': _fathernameController.text,
      'email': _emailController.text,
      'gotra': selecteGautra!,
      'gender': selecteGender!,
      'area': _areaController.text,
      'pincode': _pincodeController.text,
      'address': _dorrController.text,
      'city': selecteCity!,
      'state': selecteState!,
      'dist': selecteDist!,
      'country': selecteCountry!,
    });

    print(response.body.toString());
    print("Status Code : " + response.statusCode.toString());

    if (response.statusCode == 200) {
      // Request was successful
      var responseData = json.decode(response.body);
      // Process the responseData as needed
      print(responseData.toString());
      if (responseData["error"]) {
        String d = responseData["message"];
        Fluttertoast.showToast(msg: "$d");
        print("error occurred");
        return true;
      } else {
        String d = responseData["message"];
        Fluttertoast.showToast(msg: "$d");
        return false;
      }
      return true;
    } else {
      // Request failed
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.0.h),
                Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.sp,
                        color: Colors.orange),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    '  Step1',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.orange,
                  height: 10,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'Firstname',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*required';
                    } else if (!nameRegExp.hasMatch(value)) {
                      return 'Only alphabet allowed';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*required';
                    } else if (!nameRegExp.hasMatch(value)) {
                      return 'Only alphabet allowed';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: _fathernameController,
                  decoration: InputDecoration(
                      hintText: 'Father Name',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*required';
                    } else if (!nameRegExp.hasMatch(value)) {
                      return 'Only alphabet allowed';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: '@gmail.com',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      )),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: DropdownButton<String>(
                        hint: Text("Select Gotra"),
                        value: selecteGautra,
                        onChanged: (String? newValue) {
                          setState(() {
                            selecteGautra = newValue!;
                          });
                        },
                        items: [
                          'Hindu',
                          'Bramhan',
                          'Patel',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: DropdownButton<String>(
                        hint: Text("Select Gender"),
                        value: selecteGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            selecteGender = newValue!;
                          });
                        },
                        items: ['Male', 'Female'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Address :-',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      decoration: TextDecoration.underline),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _dorrController,
                        decoration: InputDecoration(
                            hintText: 'Door No.',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _areaController,
                        decoration: InputDecoration(
                          hintText: "Area",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _pincodeController,
                        decoration: InputDecoration(
                          hintText: "Pincode",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*required';
                          } else if (value.length != 6) {
                            return 'Invalid pincode number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: DropdownButton<String>(
                        hint: Text("Select City"),
                        value: selecteCity,
                        onChanged: (String? newValue) {
                          setState(() {
                            selecteCity = newValue!;
                          });
                        },
                        items: [
                          'Jetpur',
                          'Rajkot',
                          'Junagadh',
                          'Ahmedabad',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: DropdownButton<String>(
                        hint: Text("Select District"),
                        value: selecteDist,
                        onChanged: (String? newValue) {
                          setState(() {
                            selecteDist = newValue!;
                          });
                        },
                        items:
                            ['Rajkot', 'Jetpur', 'Amreli'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: DropdownButton<String>(
                        hint: Text("Select State"),
                        value: selecteState,
                        onChanged: (String? newValue) {
                          setState(() {
                            selecteState = newValue!;
                          });
                        },
                        items: [
                          'Gujarat',
                          'Rajasthan',
                          'Punjab',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: DropdownButton<String>(
                        hint: const Text("Select Country"),
                        value: selecteCountry,
                        onChanged: (String? newValue) {
                          setState(() {
                            selecteCountry = newValue!;
                          });
                        },
                        items:
                            ['India', 'America', 'Italy'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Material Status -',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Container(
                          width: 165,
                          child: RadioListTile(
                            title: Text('Unmarried'),
                            value: 'Unmarried',
                            groupValue: selectedStatus,
                            onChanged: (value) {
                              setState(() {
                                selectedStatus = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 165,
                          child: RadioListTile(
                            title: Text('Bachelor'),
                            value: 'Bachelor',
                            groupValue: selectedStatus,
                            onChanged: (value) {
                              setState(() {
                                selectedStatus = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Container(
                            width: 165,
                            child: RadioListTile(
                              title: Text('Divorce'),
                              value: 'Divorce',
                              groupValue: selectedStatus,
                              onChanged: (value) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 165,
                          child: RadioListTile(
                            title: Text('Separate'),
                            value: 'Separate',
                            groupValue: selectedStatus,
                            onChanged: (value) {
                              setState(() {
                                selectedStatus = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0.h),
                Text(
                  'About yourself -',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                SizedBox(height: 5.0.h),
                Text(
                  '(in 50 words)',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
                TextFormField(
                  controller: _aboutController,
                  maxLines: 3,
                  decoration: InputDecoration(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*required';
                    } else if (value.length > 50) {
                      return 'Length exceeds';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50.0.h),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      bool success = await callPhiApi();
                      if (success) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThirdPage(),
                          ),
                        );
                      }
                    },

                    child: Container(
                      width: 327.0.w,
                      height: 56.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0.r),
                        color: AppColors.buttonColor,
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16.0.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
