import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:she_banks/api_services/api_services.dart';
import 'package:she_banks/screens/loginPass.dart';
import 'package:she_banks/screens/passwordForgot.dart';
import 'package:she_banks/screens/screen_registration.dart';

import '../utils/universal_methods.dart';
import 'colors.dart';

class ForgotPassword extends StatefulWidget {
  final phone;

  ForgotPassword(this.phone, {Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _smsController = TextEditingController();
  final ApiServices _apiServices = ApiServices();
  var phone;
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;
  bool _isLoading = false;

  sanitizePhone(){
    String mPhone = widget.phone;
    setState(() {
      phone = mPhone.replaceAll('+', '');
      debugPrint('phone is>>>>>>>>>>$phone');

    });
  }
  @override
  void initState() {
    sanitizePhone();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _verification_code(),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verification_code() {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Enter OTP sent to your Mobile Number',
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
          child: _isLoading? SpinKitCircle(color: Colors.pink.shade300,): OutlinedButton(
            onPressed: () {
              verifyOtp(_smsController.text);
              // phone = _phone_controller.text;
              setState(() {
                _isLoading = true;
              });
              String code = _smsController.text;
              if (code.isEmpty) {
                UniversalMethods.show_toast(
                    'Enter the verification code sent to your phone', context);
                return;
              }
              // showLoaderDialog(context, 'verifying');
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
              "VERIFY OTP",
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

        SizedBox(height: 20),
        InkWell(onTap: () {
          enableResend ? _otpRequest(phone) : null;

        }, child: Text(
          'Resend code after $secondsRemaining seconds',

        ),)
      ],
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

  void _showDialog(String message) {
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
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 50,
                    color: Colors.pink.shade300,
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

  void verifyOtp(String text) {
    String snPhone = widget.phone;
    String finalPhone = snPhone.replaceAll('+', '');

    Map<String, String> otp = {"otp": "$text"};
    _apiServices.verifyOtp(phone, otp).then((value) {
      debugPrint('Valueeeeee....${value.toString()}');
      if (value.status == 'OK') {
        setState(() {
          _isLoading= false;
          Get.to(()=>PasswordForgot(phone: widget.phone));
        });

      } else if (value.status == 'BAD_REQUEST') {
        _showDialog(value.message.toString());
      } else {
        _showDialog('${value.message.toString()}');
      }
    });
  }
  void _otpRequest(String phone) {

    _apiServices.requestOtp(phone).then((value){
      if(value.status=='OK'){
        _showDialog('Otp Resent Successfully');
        setState((){
          secondsRemaining = 60;
          enableResend = false;
        });
      }else{
        _showDialog(value.message.toString());

      }

    });

  }
  void _resendCode() {
    //other code here
    setState((){
      secondsRemaining = 30;
      enableResend = false;
    });
  }

}
