import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:growapp/utils/UserSimplePreferences.dart';

import 'allpost.dart';
import 'color.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController _studentController = TextEditingController();
  TextEditingController _pvtController = TextEditingController();
  TextEditingController _govtController = TextEditingController();
  TextEditingController _shopController = TextEditingController();
  TextEditingController _businessController = TextEditingController();
  TextEditingController _freeController = TextEditingController();
  TextEditingController _docController = TextEditingController();
  TextEditingController _engController = TextEditingController();
  TextEditingController _lawController = TextEditingController();
  TextEditingController _otherController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _professionDescriptionController = TextEditingController();

  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  String? dropdownValue;
  String? selecteCity;
  String? selecteState;
  String? selectedStatus;
  String? selecteCountry;
  String? selecteDist;

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

  bool _showTextField = false;
  bool _showTextField1 = false;
  bool _showTextField2 = false;
  bool _showTextField3 = false;
  bool _showTextField4 = false;
  bool _showTextField5 = false;
  bool _showTextField6 = false;
  bool _showTextField7 = false;
  bool _showTextField8 = false;
  bool _showTextField9 = false;
  bool _showTextField10 = false;
  late String _selectedOption = "";
  int selectedRadio = 0;
  int selectedOption = 0;

  bool isHiden = false;

  String isHidenString = "false";

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Widget buildRadio(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedRadio,
          onChanged: (val) {
            setSelectedRadio(val!);
          },
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
      ],
    );
  }




  Future<bool> callApi() async {
    final url = Uri.parse('https://barishloan.in/Bramhin/API/thirdPage.php');

    // Prepare the data to be sent in the request body
    final data = {
      'phone': UserSimplePreferences.getPhone(),
      'profession': _selectedOption!,
      'description': _professionDescriptionController.text,
       'bcity': selecteCity!,
       'bstate': selecteState!,
      'bdist': selecteDist!,
      'bcountry': selecteCountry!,
      'bpincode': _pincodeController.text,
      'status': isHidenString!,
    };

    try {
      final response = await http.post(url, body: data);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final message = jsonResponse['message'];
        showToast(message); // Display the server response in a toast
        return true; // API call successful
      } else {
        showToast('API call failed'); // Display a generic error message
        return false; // API call failed
      }
    } catch (error) {
      print("Error: $error'");
      showToast('Error: $error'); // Display the error message in a toast
      return false; // API call failed
    }
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0.h),
              Container(
                width: double.infinity,
                child: Text(
                  'Professional Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                      color: Colors.orange),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '  Step2',
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
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      RadioListTile(
                        title: Text('Student'),
                        value: 'Student',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                            _showTextField1 = false;
                            _showTextField8 = false;
                            _showTextField2 = false;
                            _showTextField3 = false;
                            _showTextField4 = false;
                            _showTextField5 = false;
                            _showTextField6 = false;
                            _showTextField7 = false;
                            _showTextField = true;
                            _showTextField10 = false;
                            //  selectedOption=0;
                          });
                        },
                      ),
                      Visibility(
                        visible: _showTextField,
                        child: TextField(
                          controller: _professionDescriptionController,
                          decoration: InputDecoration(
                            hintText: "Course",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RadioListTile(
                    title: Text('Private Job'),
                    value: 'Private Job',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField8 = false;
                        _showTextField = false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField1 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField1,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Orgazination",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Goverment Job'),
                    value: 'Goverment Job',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField2,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Orgazination",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Shop'),
                    value: 'Shop',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField2 = false;
                        _showTextField8 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField3 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField3,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Business'),
                    value: 'Business',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField8 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField4 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField4,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Freelancer'),
                    value: 'Freelancer',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField8 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField5 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField5,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Doctor'),
                    value: 'Doctor',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField8 = false;
                        _showTextField7 = false;
                        _showTextField6 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField6,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Specialization",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Doctor'),
                    value: 'Doctor',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField8 = false;
                        _showTextField7 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField7,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Specialization",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Engineers'),
                    value: 'Engineers',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField8 = true;
                        _showTextField9 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField8,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Specialization",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Lawyers'),
                    value: 'Lawyers',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField2 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField8 = false;
                        _showTextField9 = true;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField9,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Specialization",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RadioListTile(
                    title: Text('Retired'),
                    value: 'Retired',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = false;
                        _showTextField10 = false;
                        _showTextField9 = false;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Teacher'),
                    value: 'Teacher',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = false;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Housewife'),
                    value: 'Housewife',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField10 = false;
                        _showTextField2 = false;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Farmer'),
                    value: 'Farmer',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField = false;
                        _showTextField8 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = false;
                        _showTextField10 = false;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Others'),
                    value: 'Others',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        _showTextField1 = false;
                        _showTextField10 = true;
                        _showTextField = false;
                        _showTextField8 = false;
                        _showTextField9 = false;
                        _showTextField3 = false;
                        _showTextField4 = false;
                        _showTextField5 = false;
                        _showTextField6 = false;
                        _showTextField7 = false;
                        _showTextField2 = false;
                      });
                    },
                  ),
                  Visibility(
                    visible: _showTextField10,
                    child: TextField(
                      controller: _professionDescriptionController,
                      decoration: InputDecoration(
                        hintText: "Others",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Text(
                'Locatiion :-',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    decoration: TextDecoration.underline),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _pincodeController,
                      decoration: const InputDecoration(
                        hintText: "Pincode",
                      ),
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
                      items: ['Rajkot', 'Jetpur', 'Amreli'].map((String value) {
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
              //selecteState
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
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: DropdownButton<String>(
                      hint: Text("Select Country"),
                      value: selecteCountry,
                      onChanged: (String? newValue) {
                        setState(() {
                          selecteCountry = newValue!;
                        });
                      },
                      items: ['India', 'America', 'Italy'].map((String value) {
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
                  Checkbox(
                    value: isHiden,
                    onChanged: (value) {
                      setState(() {
                        isHiden = value!;
                        if(value){
                          isHidenString = "true";
                        }else{
                          isHidenString = "false";
                        }
                      });
                    },
                  ),
                  Text(
                    'Hide for public',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 50.0.h),
              Center(
                child: GestureDetector(
                  onTap: () async{

                    bool success = await callApi();
                    if (success) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  AllPostsPage(),
                        ),
                      );
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ThirdPage()),
                    // );
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
    );
  }
}
