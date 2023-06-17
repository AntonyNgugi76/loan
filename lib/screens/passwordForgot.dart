import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/screens/loginPass.dart';

import '../api_services/api_services.dart';
import '../utils/universal_methods.dart';
import 'colors.dart';

class PasswordForgot extends StatefulWidget {

  final phone;


  const PasswordForgot(
      { Key? key, required this.phone})
      : super(key: key);

  @override
  State<PasswordForgot> createState() => _PasswordForgotState();
}

class _PasswordForgotState extends State<PasswordForgot> {
  var token;
  final ApiServices _apiServices = ApiServices();

  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController cnfNewPassword = TextEditingController();

  // final TextEditingController controller_email = TextEditingController();
  // final TextEditingController controller_id_number = TextEditingController();


  getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.get('token');

    debugPrint('token isss.........$token');
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              leading: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              largeTitle: const Text('Forgot Password'),
            ),
          ];
        },
        body: Container(
          margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                first_tile(),
                const SizedBox(
                  height: 32,
                ),
                _phone_input(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget first_tile() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Container(
        //   // margin: EdgeInsets.only(left: 16),
        //   child: Column(
        //     children: [
        //       const SizedBox(
        //         height: 8,
        //       ),
        //       InkWell(
        //         onTap: () {},
        //         child: Container(
        //           child: Row(
        //             children: [
        //               Image.asset(
        //                 'assets/images/default_avatar.png',
        //                 height: 50,
        //                 width: 50,
        //                 color: MyColors().primaryColor,
        //               ),
        //               const SizedBox(
        //                 width: 8,
        //               ),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     '${widget.fName} ${widget.lName}',
        //                     style: const TextStyle(
        //                         fontSize: 15, fontWeight: FontWeight.w400),
        //                   ),
        //                   Text(
        //                     '${widget.email}',
        //                     style: TextStyle(
        //                       fontSize: 13,
        //                       color: Colors.grey[600],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget _phone_input() {
    return Column(
      children: [

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                obscureText: true,
                controller: newPassword,
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
                    return "New Password cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: TextStyle(
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
                obscureText: true,
                controller: cnfNewPassword,
                decoration: InputDecoration(
                  hintText: 'New Password',
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
                    return "New Passwrd cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),

        SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 42,
          child: OutlinedButton(
            onPressed: () {
              get_user_info();
            },
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(MyColors().primaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
            child: const Text(
              "SUBMIT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  get_user_info() async {
    var old = oldPassword.text;
    var newPass = newPassword.text;
    var cnfNew = cnfNewPassword.text;


    // if (old.isEmpty) {
    //   FocusScope.of(context).unfocus();
    //   UniversalMethods.show_toast('Old Password is required', context);
    //   return false;
    // }

    if (newPass.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('New Password is required', context);
      return;
    }
    if (cnfNew.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('New Password is required', context);
      return;
    }
    if (newPass != cnfNew) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('Password mismatch', context);
      return;
    }


    // if (id_number.isEmpty) {
    //   FocusScope.of(context).unfocus();
    //   UniversalMethods.show_toast('ID number is required', context);
    //   return;
    // }

    // UniversalMethods().showLoaderDialog(context, 'Saving');
    // FocusScope.of(context).unfocus();

    // await addUser(first_name, second_name, last_name, email);


    Map data = { "password": "$newPass"};
    _apiServices.forgotPassword(widget.phone, data).then((value) {
      if(value.status == "OK"){
        _successDialog(value.message.toString());


      }
      else{
        UniversalMethods.show_toast(value.message.toString(), context);
      }

    });


  }
  void _successDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                child: Column(children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Icon(
                    Icons.check_circle,
                    size: 50,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(message),
                  const SizedBox(
                    height: 24,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Get.offAll(()=>LoginPass());
                      },
                      child: const Text('Ok'))
                ])),
          );
        });
  }


}