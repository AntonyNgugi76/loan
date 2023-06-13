import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_services/api_services.dart';
import '../utils/universal_methods.dart';
import 'colors.dart';

class ChangePassword extends StatefulWidget {

  final  fName;
  final  lName;
  final  email;
  final userId;
  const ChangePassword({required this.fName,required this.email, required this.lName, required this. userId,Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var token;

  final TextEditingController controller_first_name = TextEditingController();
  final TextEditingController controller_second_name = TextEditingController();
  final TextEditingController controller_last_name = TextEditingController();
  final TextEditingController controller_email = TextEditingController();
  final TextEditingController controller_id_number = TextEditingController();


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
              largeTitle: const Text('Change Password'),
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
        Container(
          // margin: EdgeInsets.only(left: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/default_avatar.png',
                        height: 50,
                        width: 50,
                        color: MyColors().primaryColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.fName} ${widget.lName}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${widget.email}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
                controller: controller_first_name,
                decoration: new InputDecoration(
                  hintText: 'Old Password',
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
                    return "Old Password cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: new TextStyle(
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
                controller: controller_second_name,
                decoration: new InputDecoration(
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
                    return "New Password cannot be empty";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                style: new TextStyle(
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
                controller: controller_last_name,
                decoration: new InputDecoration(
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
                style: new TextStyle(
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
          width: MediaQuery.of(context).size.width,
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
    var oldPassword = controller_first_name.text;
    var newPassword = controller_second_name.text ?? '';
    var cnfNewPassword = controller_last_name.text;
    // var email = controller_email.text;
    // var id_number = controller_id_number.text;

    if (oldPassword.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('Old Password is required', context);
      return false;
    }

    if (newPassword.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('New Password is required', context);
      return;
    }
    if (cnfNewPassword.isEmpty) {
      FocusScope.of(context).unfocus();
      UniversalMethods.show_toast('New Password is required', context);
      return;
    }
    if (cnfNewPassword!=newPassword) {
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
  }

  Future addUser(first_name, second_name, last_name, email) async {
    // var userId = widget.userId;
    debugPrint('email is $email');
    Map signup_data = {
      'firstName': first_name,
      'middleName': second_name,
      'lastName': last_name,
      'email': email,
      // 'idNumber': id_number,
      // 'mobileNumber': widget.mobile,
      // John Doe
    };

    // ApiServices().update_data(signup_data, userId, token).then((value) {
    //   if (value.status == "OK") {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text('${value.message.toString()}')));
    //     // Get.to(()=)
    //   } else if (value.status == "BAD_REQUEST") {
    //     showDialog(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return AlertDialog(
    //             title: const Text('Alert'),
    //             content: Text('${value.message.toString()}'),
    //           );
    //         });
    //   } else {
    //     return const Text('An error occured');
    //   }
    // });
  }
}