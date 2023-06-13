import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/api_services/api_services.dart';
import 'package:she_banks/screens/colors.dart';
import 'package:she_banks/screens/restart_widget.dart';
import 'package:she_banks/screens/screen_home.dart';
import 'package:she_banks/screens/screen_registration.dart';
import 'package:she_banks/screens/loginPass.dart';
import 'package:she_banks/screens/screen_verifyOTP.dart';
import 'package:she_banks/utils/universal_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/FirebaseModel.dart';
import '../models/model_user.dart';

class AccountLogin extends StatefulWidget {
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<AccountLogin> {
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  final TextEditingController _smsController = TextEditingController();
  String? _verificationId;
  final ApiServices _apiServices = ApiServices();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _phone_controller = TextEditingController();
  bool is_code_sent = false;
  bool _isLoading = false;
  String phone = "";
  String partPhone = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? users;
  String? country_code = '+254';

  adddPhoneNumber(String mPhone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("PhoneNumber", mPhone);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_get_country_code();
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text('Demo'),
    );
    double app_bar_height = appBar.preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Make women financially strong and independent',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 100,
              ),
              is_code_sent ? _verification_code() : _phone_input(),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reg_code_text() {
    return Column(
      children: [
        TextFormField(
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 16 * 4),
          maxLength: 6,
          controller: _smsController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            hintText: '6 digit code',
            hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1.0,
              ),
            ),
            //fillColor: Colors.green
          ),
          validator: (val) {
            if (val!.length == 0) {
              return "Code cannot be empty";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ],
    );
  }

  Widget _phone_input() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone number',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CountryListPick(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: const Text('Select Country Code'),
                ),

                // To disable option set to false
                theme: CountryTheme(
                  isShowFlag: true,
                  isShowTitle: false,
                  isShowCode: true,
                  isDownIcon: true,
                  showEnglishName: false,
                ),
                // Set default value
                initialSelection: country_code,

                // or

                // initialSelection: 'US'
                onChanged: (CountryCode? code) {
                  country_code = code!.dialCode;

                  print(code!.name);
                  print(code.code);
                  print(code.dialCode);
                  print(code.flagUri);
                },
                // Whether to allow the widget to set a custom UI overlay
                useUiOverlay: true,
                // Whether the country list should be wrapped in a SafeArea
                useSafeArea: false),
            Flexible(
                child: TextFormField(
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16 * 4),
              maxLength: 14,
              controller: _phone_controller,
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey),

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
            )),
          ],
        ),

        const SizedBox(
          height: 36,
        ),

        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 42,
          child: OutlinedButton(
            onPressed: () {
              phone = _phone_controller.text;
              print(partPhone);

              if (phone!.isEmpty) {
                UniversalMethods.show_toast(
                    'Add phone number to proceed', context);
                return;
              }
              phone = '${country_code}${phone}';
              print(country_code);

              // return;

              // String sub_phone = phone!.substring(0, 1).trim();
              //
              // print(sub_phone);
              //
              // if (sub_phone != '+') {
              //   phone = "+" + phone!.substring(0, phone!.length);
              // }
              print(phone);

              phone = phone.replaceAll('+', '');
              FocusScope.of(context).unfocus();

              showLoaderDialog(context, 'authenticating');
              adddPhoneNumber(phone);
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: ((context) => Homescreen())));

              // _verifyPhoneNumber(phone!);
              _otpRequest(phone);

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
              "Activate",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Container(
        //       child: Row(
        //         children: <Widget>[
        //           TextButton(
        //             style: TextButton.styleFrom(
        //                 backgroundColor: Colors.teal,
        //                 foregroundColor: Colors.white),
        //
        //             onPressed: () {
        //               // phone = _phone_controller.text;
        //               // if (phone!.isEmpty) {
        //               //   UniversalMethods.show_toast(
        //               //       'Add phone number to proceed');
        //               //   return;
        //               // }
        //               //
        //               // String sub_phone = phone!.substring(0, 1).trim();
        //               //
        //               // print(sub_phone);
        //               //
        //               // if (sub_phone != '+') {
        //               //   phone = "+" + phone!.substring(0, phone!.length);
        //               // }
        //               // print(phone);
        //               // phone = phone?.replaceAll(' ', '');
        //               //
        //               // showLoaderDialog(context, 'authenticating');
        //               //
        //               // _verifyPhoneNumber(phone!);
        //               _move_next_page();
        //             },
        //             // color: HexColor('#0F305E'),
        //             // textColor: Colors.white,
        //             child: Text(
        //               "Login",
        //               style: TextStyle(fontSize: 14),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _verification_code() {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Phone Verification',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              child: _reg_code_text(),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 42,
          child: OutlinedButton(
            onPressed: () {
              phone = _phone_controller.text;
              String code = _smsController.text;
              if (code.isEmpty) {
                UniversalMethods.show_toast(
                    'Enter the verification code sent to your phone', context);
                return;
              }
              showLoaderDialog(context, 'verifying');
              // signInWithPhoneNumber();
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
              "PROCEED",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Container(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: <Widget>[
        //       OutlinedButton(
        //         onPressed: () {
        //           // String code = _smsController.text;
        //           // if (code.isEmpty) {
        //           //   UniversalMethods.show_toast(
        //           //       'Enter the verification code sent to your phone');
        //           //   return;
        //           // }
        //           // showLoaderDialog(context, 'verifying');
        //           // signInWithPhoneNumber();
        //         },
        //         // color: HexColor('#0F305E'),
        //         // textColor: Colors.white,
        //         child: Text(
        //           "Proceed",
        //           style: TextStyle(fontSize: 14),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  // _move_next_page(User user) async {
  //   users = users_path;
  //   Navigator.of(context).pop();
  //   DocumentSnapshot docsnap = await users!.doc(user.uid).get();
  //
  //   if (!docsnap.exists) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => ScreenRegistration(),
  //       ),
  //     );
  //   } else {
  //     Phoenix.rebirth(context);
  //     // RestartWidget.restartApp(context);
  //     //ModelUser user = ModelUser.fromARFirestore(docsnap);
  //     // Navigator.of(context).pushAndRemoveUntil(
  //     //     MaterialPageRoute(builder: (context) => Homescreen()),
  //     //     (Route<dynamic> route) => false);
  //   }
  //
  //   // Navigator.of(context).pushAndRemoveUntil(
  //   //     MaterialPageRoute(builder: (context) => Homescreen()),
  //   //     (Route<dynamic> route) => false);
  // }

//   _verifyPhoneNumber(String phone) async {
// //Callback for when the user has already previously signed in with this phone number on this device
//     verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
//       final User user =
//           (await auth.signInWithCredential(phoneAuthCredential)).user!;
//       debugPrint('Name is"""""${user.displayName}');
//       debugPrint('Phone number""""""""${user.phoneNumber}');
//
//       // _move_next_page(user);
//
//       showSnackbar("Phone number automatically verified and user signed in");
//     }
//
// //Listens for errors with verification, such as too many attempts
//     verificationFailed(FirebaseAuthException authException) {
//       debugPrint('Error, $authException');
//
//       Navigator.of(context).pop();
//       showSnackbar(
//           'Phone number verification failed. Check your number and try again');
//     }
//
//     //Callback for when the code is sent
//     codeSent(String verificationId, [int? forceResendingToken]) async {
//       print('EEEEEEEEEEEEEEEEE');
//
//       Navigator.of(context).pop();
//
//       setState(() {
//         is_code_sent = true;
//       });
//
//       showSnackbar('Please check your sms inbox for the code');
//       _verificationId = verificationId;
//     }
//
//     codeAutoRetrievalTimeout(String verificationId) {
//       showSnackbar("Auto verification timeout");
//       _verificationId = verificationId;
//     }
//
//     try {
//       await auth.verifyPhoneNumber(
//           phoneNumber: phone,
//           timeout: const Duration(seconds: 10),
//           verificationCompleted: verificationCompleted,
//           verificationFailed: verificationFailed,
//           codeSent: codeSent,
//           codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//     } catch (e) {
//       Navigator.of(context).pop();
//       showSnackbar("Failed to Verify Phone Number");
//     }
//   }

  // void signInWithPhoneNumber() async {
  //   debugPrint('ver....$_verificationId');
  //   try {
  //     final AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: _verificationId!,
  //       smsCode: _smsController.text,
  //     );
  //
  //     final User user = (await auth.signInWithCredential(credential)).user!;
  //
  //     debugPrint('username ${user.uid}' + 'Phone${user.phoneNumber}');
  //
  //     showSnackbar("Successfully signed in UID");
  //
  //     Get.offAll(() => ScreenRegistration());
  //
  //     // _move_next_page(user);
  //   } catch (e) {
  //     Navigator.of(context).pop();
  //     showSnackbar("Invalid sms code, please try again later");
  //   }
  // }

  // void showSnackbar(String message) {
  //   UniversalMethods.show_toast(message, context);
  // }

  showLoaderDialog(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text("${message}...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  openLoadingDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(children: <Widget>[
          const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation(Colors.black))),
          const SizedBox(width: 10),
          Text(text)
        ]),
      ),
    );
  }
  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.27,
                child: Column(children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Icon(
                    Icons.warning_amber_rounded,
                    size: 50,
                    color: Colors.pink,
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
                        Navigator.of(context).pop();
                        // push(MaterialPageRoute(
                        // builder: (context) => Homescreen(fName: fName, lName: lName, phone: phone, token: token, email: email, userId: userId)));
                      },
                      child: const Text('Ok'))
                ])),
          );
        });
  }

  void _otpRequest(String phone) {
    _apiServices.requestOtp(phone).then((value){
      if(value.status=='OK'){
        Get.off(()=> VerifyOTP(phone));
      }else{
        _showDialog(value.message.toString());

      }

    });

  }
}
