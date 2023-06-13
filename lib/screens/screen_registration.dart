import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/api_services/api_services.dart';
import 'package:she_banks/models/loginModel.dart';
import 'package:she_banks/screens/colors.dart';
import 'package:she_banks/screens/loginPass.dart';
import 'package:she_banks/screens/restart_widget.dart';
import 'package:she_banks/screens/screen_home.dart';
import 'package:she_banks/screens/screen_login.dart';
import 'package:she_banks/utils/universal_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/FirebaseModel.dart';
import '../models/model_user.dart';

class ScreenRegistration extends StatefulWidget {
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenRegistration> {
  final _apiServices = ApiServices();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfpasswordController = TextEditingController();
  final TextEditingController controller_first_name = TextEditingController();
  final TextEditingController controller_second_name = TextEditingController();
  final TextEditingController controller_last_name = TextEditingController();
  final TextEditingController controller_email = TextEditingController();
  final TextEditingController controller_id_number = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool is_code_sent = false;
  bool _isLoading= false;
  String? phone, partPhone;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference? users;
  // final ApiServices _apiServices = ApiServices();

  getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mPhone = prefs.getString("PhoneNumber");
    phone = mPhone?.replaceAll('+', '');
  }
  storeToken(String token) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token);

  }
  storeUserBool()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('userExists', true);
  }


  @override
  void initState() {
    getPhone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text('Demo'),
    );
    double app_bar_height = appBar.preferredSize.height;
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Scaffold(
      //
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Your Personal Details',
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              // CircleAvatar(
              //   backgroundColor: Colors.black,
              //   radius: 30,
              //   child: CircleAvatar(
              //     radius: 30,
              //     backgroundImage: AssetImage('assets/images/logo.png'),
              //   ),
              // ),
              // SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   'Make women financially strong and independent',
              //   style: TextStyle(fontSize: 13),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              const Text(
                'Fill in the following details to proceed',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              _phone_input(),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _phone_input() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Required*'),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: controller_first_name,
                decoration: InputDecoration(
                  hintText: 'First name',
                  contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Phone number be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: controller_second_name,
                decoration: InputDecoration(
                  hintText: 'Middle name',
                  contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Phone number be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Text('Required*'),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: controller_last_name,
                decoration: InputDecoration(
                  hintText: 'Last name',
                  contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Phone number be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Text('Required*'),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: controller_email,
                decoration: InputDecoration(
                  hintText: 'Email address',
                  contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Phone number be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Text('Required*'),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                maxLength: 10,
                controller: controller_id_number,
                decoration: InputDecoration(
                  hintText: 'National ID number',
                  contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Phone number be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                // maxLength: 10,
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Password cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                // maxLength: 10,
                controller: cnfpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),

                  hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val!.length == 0) {
                    return "Password cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 42,
          child:

          _isLoading? SpinKitCircle(color: Color(0xffed39ca),):
          OutlinedButton(
            onPressed: () {
              get_user_info();

              // Get.off(()=>LoginPass());
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => Homescreen(),
              //   ),
              // );
            },
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(Color(0xffed39ca),),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
            child: const Text(
              "FINISH",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  get_user_info() async {
    String _firstName = controller_first_name.text;
    String _middleName = controller_second_name.text;
    String _lastName = controller_last_name.text;
    String _emailAddress = controller_email.text;
    var _id = controller_id_number.text;
    String _idNumber = _id.toString();
    var _pass = passwordController.text;
    String _password = _pass.toString();
    var _passCnf = cnfpasswordController.text;
    // var _phone = auth.currentUser!.phoneNumber;

    if (_firstName.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('First name is required', context);
      return false;
    }

    if (_middleName.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('First second is required', context);
      return false;
    }

    if (_lastName.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('Last name is required', context);
      return;
    }
    if (_emailAddress.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('Email is required', context);
      return;
    }

    if (_idNumber.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('ID number is required', context);
      return;
    }
    if (_password != _passCnf) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('Passwords do not match', context);
      return;
    }
    setState(() {
      _isLoading = true;
    });

    // UniversalMethods().showLoaderDialog(context, 'Saving');
    // FocusScope.of(context).unfocus();

    await reqBody(
        _firstName,
        _middleName,
        _lastName,
        _emailAddress,
        _idNumber,
        _password,
        phone);
  }

  Future reqBody(_firstName, _middleName, _lastName, _emailAddress, _idNumber,
      _password, phone) async {
    // Call the user's CollectionReference to add a new user
    Map _newRequestData = {
      'firstName': _firstName,
      'middleName': _middleName,
      'lastName': _lastName,
      'email': _emailAddress,
      'idNumber': "$_idNumber",
      'password': "$_password",
      'mobile': "$phone",
    };

    // ApiServices()
    _apiServices.sign_up(_newRequestData)
        .then((value) {
          setState(() {
            _isLoading= false;
          });
      debugPrint('value is......''$value');
      // var token  = value
      if (value.status == 'OK') {
        storeUserBool();
       Get.offAll(()=>LoginPass());
       UniversalMethods.show_toast('Registration Successful', context);
       // Get.snackBar('Successful','Registration');
        debugPrint('tmessage is.......${value.message}');
      }
      else if(value.status=='BAD_REQUEST')
      {
        return showDialog<void>(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('${value.message.toString()}'),

              );
      //
      //         // var error = value['error'];
      //         // if (error) {
      //         //   Navigator.pop(context);
      //         //   UniversalMethods.show_toast(value['message'], context);
      //         // } else {
      //         // var response = value.toString();
      //         // var decoded = jsonDecode(response);
      //         // var loginResp = Login.fromJson(decoded);
      //         // var token = loginResp.data?.token;
      //         // debugPrint('bearer token """"""""""$token');
      //
      //
      //         // }
            });
      }
    });
    }
  }

