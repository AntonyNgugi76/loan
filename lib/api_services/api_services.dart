import 'dart:collection';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/models/Activation.dart';
import 'package:she_banks/models/IQ.dart';
import 'package:she_banks/models/Registration.dart';
import 'package:she_banks/models/Success.dart';
import 'package:she_banks/models/laon.dart';
import 'package:she_banks/models/loan_types.dart';
import 'package:she_banks/models/loginModel.dart';
import 'package:she_banks/models/model_user.dart';
import 'package:she_banks/models/seedModel.dart';

import '../models/Error.dart';
import '../models/FirebaseModel.dart';
import 'package:dio/dio.dart';

import '../models/LoanApplicationModel.dart';
import '../models/model_loan_status.dart';
import '../models/updateModel.dart';

final dio = Dio();

class ApiServices {
  // late String base_url;
  bool test = false;

  // if(test) {
  // fibase_url= '192.168.137.202:8080/she/api/v1';
  // }else {
  // base_url= 'http://192.168.152.238:8080/she/api/v1';
  // }
  //live
  final String base_url = 'https://shebnks.com/she/api/v1';
  // final String base_url = 'https://dca.com/she/api/v1';
  // /she/api/v1/loan/request/:userId
  //test
  // final String base_url = 'http://192.168.29.238:8080/she/api/v1';

  // /auth/login';
  FirebaseAuth auth = FirebaseAuth.instance;

  Future requestOtp(String mobile) async {
    String url = base_url + '/user/auth/otp/${mobile}';
    final response = await http.get(Uri.parse(url));
    debugPrint('otpResponse${response.body}');

    if (response.statusCode == 200) {
      return SuccessModel.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
  }

  Future forgotPassword(String mobile, Map _data) async {
    String url = base_url + '/user/auth/password/forgot/${mobile}';

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.post(Uri.parse(url), headers: header,body: jsonEncode(_data));
    debugPrint('forgot${response.body}');

    if (response.statusCode == 200) {
      return SuccessModel.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
  }
  Future changePin(String _userdId, String _token, Map _data) async {
    String url = base_url + '/user/auth/password/change/${_userdId}';

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_token}',
    };
    debugPrint('cPin request>>>>>${_data}');

    final response = await http.post(Uri.parse(url), headers: header, body: jsonEncode(_data));
    debugPrint('cPin${response.body}');

    if (response.statusCode == 200) {
      return SuccessModel.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
  }

  Future verifyOtp(String mobile, Map otp) async {
    String url = base_url + '/user/auth/otp/${mobile}';

    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    debugPrint('requestBody.........$otp');

    final response = await http.post(Uri.parse(url),headers: header, body: jsonEncode(otp));
    debugPrint('otpResponse${response.body}');

    if (response.statusCode == 200) {
      return Activation.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
  }

  Future sign_up(Map data) async {
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',

    };
    String url = base_url + '/user/auth/register';
    debugPrint('requestBody...................$data');

    final response = await http.post(Uri.parse(url),
        headers: header, body: jsonEncode(data));
    debugPrint('responsedata${response.body}');

    if (response.statusCode == 200) {
      return Registrartion.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
    // } catch(e){
    //   print('Error is ${e.toString()}');
    // }
  }

  Future getAllIQ(String _token) async {
    String url = base_url + '/survey/quiz/all';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_token}',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    debugPrint('Response is......${response.body}');

    if (response.statusCode == 200) {
      return IQ.fromJson(jsonDecode(response.body));
    } else
      return ErrorP.fromJson(jsonDecode(response.body));
  }

  Future login(Map data) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    String url = base_url + '/user/auth/login';
    debugPrint('requestBody...................$data');
    final response = await http.post(Uri.parse(url),
        headers: header, body: jsonEncode(data));
    debugPrint('Login response is...................${response.body}');

    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
  }

  Future update_data(Map data, String _userId, String _token) async {
    String url = base_url + '/user/profile/update/${_userId}';

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_token}',
    };
    print(headers);

    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );
    debugPrint('response is...................${response}');
    if (response.statusCode == 200) {
      return UpdateModel.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
  }

   submit_iq( iq_body, String _token, String _userId) async {
    String url = '${base_url}/iq/create/$_userId';
    print('id$_userId');
    print('token$_token');
    print('Body$iq_body');



    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token ',
      };
      debugPrint('requestbodyisss......' + '${iq_body}');

      final response =
          await http.post(Uri.parse(url), headers: headers, body: jsonEncode(iq_body));
      debugPrint('IQ Response>>>>>>>${response.body}');
      if(response.statusCode == 200){
        return SuccessModel.fromJson(jsonDecode(response.body));
      }
      else{
        return ErrorP.fromJson(jsonDecode(response.body));
      }

      Map data = json.decode(response.body);
      return data;
    } catch (error) {
      print(error);
      return {'error': true, 'message': error};
    }
  }

  Future applyloan(Map _data, String _token, String _userId) async {
    String url = base_url + '/loan/request/${_userId}';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_token}',
    };
    debugPrint('Loan Request is>>>>${_data}' + '$_userId}');

    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(_data));

    debugPrint('Loan Response is>>>>${response.body}');

    if (response.statusCode == 200) {
      return LoanApplicationModel.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
  }

  Future repayLoan(String _loanId, String _token, Map _data) async{
    String url = base_url + '/loan/payment/ctb/${_loanId}';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_token}',
    };
    debugPrint('Loan repayment Request is>>>>${_data}' + '$_loanId}');

    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(_data));

    debugPrint('Loan Response is>>>>${response.body}');

    if (response.statusCode == 200) {
      return SuccessModel.fromJson(jsonDecode(response.body));
    } else {
      return Exception('EEEEEE>>>>>>${response.body}');
    }

  }

  applySeedFund(String _userId, Map _data, String _token) async {
    String url = base_url + '/seed/create/${_userId}';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_token}',
    };
    debugPrint('SeedApplication is>>>>>>$_data');
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(_data));
    debugPrint('Seed Fund Response is>>>>${response.body}');

    if (response.statusCode == 200) {
      return SuccessModel.fromJson(jsonDecode(response.body));
    } else {
      return ErrorP.fromJson(jsonDecode(response.body));
    }
  }

  checkSeedProgress(String _userId, String _token) async {
    String url = base_url + '/seed/${_userId}';
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_token}',
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    debugPrint('Seed Fund Progress Response is>>>>${response.body}');

    if (response.statusCode == 200) {
      return SeedFundModel.fromJson(jsonDecode(response.body));
    } else {
      return Exception('Errorrrr>>>${response.body}');
    }
  }

}
