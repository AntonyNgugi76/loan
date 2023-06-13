import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/screens/screen_home.dart';
import 'package:she_banks/screens/screen_she_funds.dart';

import '../api_services/api_services.dart';
import '../utils/universal_methods.dart';
import 'colors.dart';

class LoansPage extends StatefulWidget {
  final token;
  final fName;
  final userId;

  LoansPage({required this.token, required this.fName, required this.userId});

  @override
  _LoansPageState createState() => _LoansPageState();
}

class _LoansPageState extends State<LoansPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _apiServices = ApiServices();
  storeHasLoan() async{
    SharedPreferences _prefs =await SharedPreferences.getInstance();
    _prefs.setBool('hasExistingLoan', true);
  }

// '
//   1What is your full name and contact information?
//   2Are you a woman-owned business?
//   3How long have you been operating your business?
//   4What is the legal structure of your business (sole proprietorship, partnership, LLC, etc.)?
//   5What is the industry or sector of your business?
//   6How much funding are you seeking for your business?
//   7What is the purpose of the loan? (e.g., working capital, equipment purchase, expansion, etc.)
//   8How will the loan funds be used to benefit your business?
//   9What is your estimated timeline for repayment of the loan?
//   10Can you provide a brief overview of your business, including its products or services?
//   11What is your business's annual revenue and net profit (if applicable)?
//   12Do you have any existing loans or outstanding debts related to your business?
//   13Are you willing to provide collateral or a personal guarantee for the loan?
//   14Have you previously applied for a business loan? If yes, please provide details.
//   15Can you provide financial statements for your business, such as income statements and balance sheets?
//   16How many employees do you currently have, and do you plan to hire additional staff with the loan funds?
//   17Are you currently experiencing any financial challenges or legal issues related to your business?
//   18Do you have a business plan or strategy for growth and sustainability?
//   19What sets your business apart from competitors in your industry?
//   20Are you involved in any women-focused or community initiatives?
//   21How do you plan to market and promote your business in the future?
//   22Can you provide references from clients, suppliers, or partners who can vouch for your business's reliability?
//   23Have you participated in any business or entrepreneurship training programs?
//   24Are you willing to work with a business mentor or advisor, if offered?
//   25Is there any additional information you would like to provide to support your loan application?'
  TextEditingController _amountController = TextEditingController();
  TextEditingController _womanOwnedController = TextEditingController();
  TextEditingController _howLongController = TextEditingController();

  // TextEditingController .dispose();
  TextEditingController _legalController = TextEditingController();
  TextEditingController _industryController = TextEditingController();
  TextEditingController _loanPurposeController = TextEditingController();
  TextEditingController _loanUseController = TextEditingController();
  TextEditingController _estimatedTimeController = TextEditingController();
  TextEditingController _businessOverviewController = TextEditingController();
  TextEditingController _annualRevenueTimeController = TextEditingController();
  TextEditingController _existingLoansController = TextEditingController();
  TextEditingController _collateralController = TextEditingController();
  TextEditingController _previouslyAppliedController = TextEditingController();
  TextEditingController _statementController = TextEditingController();
  TextEditingController _employeeNoController = TextEditingController();
  TextEditingController _financialChallengesController =
  TextEditingController();
  TextEditingController _bplanController = TextEditingController();
  TextEditingController _competitorController = TextEditingController();
  TextEditingController _womenController = TextEditingController();
  TextEditingController _marketingController = TextEditingController();
  TextEditingController _reliabilityController = TextEditingController();
  TextEditingController _trainingController = TextEditingController();
  TextEditingController _mentorController = TextEditingController();
  TextEditingController _otherInfoController = TextEditingController();

  // TextEditingController _trainingController = TextEditingController();

  @override
  void dispose() {
    // _amountController.dispose();
    _amountController.dispose();
    _womanOwnedController.dispose();
    _howLongController.dispose();
    _legalController.dispose();
    _industryController.dispose();
    _loanPurposeController.dispose();
    _loanUseController.dispose();
    _estimatedTimeController.dispose();
    _businessOverviewController.dispose();
    _annualRevenueTimeController.dispose();
    _existingLoansController.dispose();
    _collateralController.dispose();
    _previouslyAppliedController.dispose();
    _statementController.dispose();
    _employeeNoController.dispose();
    _financialChallengesController.dispose();
    _bplanController.dispose();
    _competitorController.dispose();
    _womenController.dispose();
    _marketingController.dispose();
    _reliabilityController.dispose();
    _trainingController.dispose();
    _mentorController.dispose();
    _otherInfoController.dispose();
    // TextEditingController _trainingController = TextEditingController();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final amount = _amountController.text;
      final womanOwned = _womanOwnedController.text;
      final howLong = _howLongController.text;
      final legal = _legalController.text;
      final industry = _industryController.text;
      final loanPurpose = _loanPurposeController.text;
      final loanUse = _loanUseController.text;
      final estTime = _estimatedTimeController.text;
      final businessOverview = _businessOverviewController.text;
      final annualRevenue = _annualRevenueTimeController.text;
      final existingloans = _existingLoansController.text;
      final collateral = _collateralController.text;
      final previouslyAppplied = _previouslyAppliedController.text;
      final statement = _statementController.text;
      final employeeNo = _employeeNoController.text;
      final financialChallenges = _financialChallengesController.text;
      final bPlan = _bplanController.text;
      final competitor = _competitorController.text;
      final women = _womenController.text;
      final marketing = _marketingController.text;
      final reliability = _reliabilityController.text;
      final training = _trainingController.text;
      final mentor = _mentorController.text;
      final otherInfo = _otherInfoController.text;

      final loanData = {
        'amount': amount,
        "survey": {
          'womanOwned': womanOwned,
          'howLong': howLong,
          'legal': legal,
          'industry': industry,
          'loanPurpose': loanPurpose,
          'loanUse': loanUse,
          'estTime': estTime,
          'businessOverview': businessOverview,
          'annualRevenue': annualRevenue,
          'existingloans': existingloans,
          'collateral': collateral,
          'previouslyAppplied': previouslyAppplied,
          'statement': statement,
          'employeeNo': employeeNo,
          'financialChallenges': financialChallenges,
          'bPlan': bPlan,
          'competitor': competitor,
          'women': women,
          'marketing': marketing,
          'reliability': reliability,
          'training': training,
          'mentor': mentor,
          'otherInfo': otherInfo,
        }
      };
      _apiServices
          .applyloan(loanData, widget.token, widget.userId)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
        if (value.status == 'OK') {
          // var
          // storeHasLoan();
          _successDialog('Loan Application Submitted Successfully');
          debugPrint('tmessage is.......${value.message.toString()}');
        } else if (value.status == 'BAD_REQUEST') {
          _showDialog('${value.message.toString()}');
        }
      });

      // _amountController.clear();
    }
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
                    .height * 0.5,
                child: Column(children: [
                  const SizedBox(
                    height: 24,
                  ),
                   const Icon(
                    Icons.warning_amber_rounded,
                    size: 50,
                    color:   Color(0xffed39ca),
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
                        // builder: (context) => Homescreen()));
                      },
                      child: const Text('Ok'))
                ])),
          );
        });
  }
  void _successDialog(String message) {
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
                        Navigator.of(context).pop();
                        // push(MaterialPageRoute(
                        // builder: (context) => Homescreen()));
                      },
                      child: const Text('Ok'))
                ])),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Apply SheLoan'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left:16, right:16),
                  child: Column(
                      children: <Widget>[
                      Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('* All fields are required'),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                              'How much funding are you seeking for your business (Limit KES 50,000)*'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                // height: 60,
                                child: TextFormField(
                                  controller: _amountController,
                                  decoration: InputDecoration(
                                    hintText: 'Amount',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        16.0, 0, 16.0, 0),

                                    hintStyle: const TextStyle(
                                        fontSize: 13, color: Colors.grey),
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
                                      return "Amount cannot be empty";
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
                            height: 20,
                          ),
                          const Text('Are you a woman-owned business?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: _womanOwnedController,
                                  decoration: InputDecoration(
                                    hintText: 'Member',
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(
                                            16.0, 0, 16.0, 0),

                                    hintStyle: const TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (val) {
                                    if (val!.length == 0) {
                                      return "Field Cannot be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                      // fontFamily: "Poppins",
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              'How long have you been operating your business?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _howLongController,
                              decoration: InputDecoration(
                                hintText: 'Operations of the business',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'What is the legal structure of your business (sole proprietorship, partnership, LLC, etc.)?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _legalController,
                              decoration: InputDecoration(
                                hintText: 'Legal structure',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'What is the industry or sector of your business?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _industryController,
                              decoration: InputDecoration(
                                hintText: 'Business Sector',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'What is the purpose of the loan? (e.g., working capital, equipment purchase, expansion, etc.)'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _loanPurposeController,
                              decoration: InputDecoration(
                                hintText: 'Loan purpose',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'How will the loan funds be used to benefit your business?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _loanUseController,
                              decoration: InputDecoration(
                                hintText: 'Use of the loan',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'What is your estimated timeline for repayment of the loan?'),
                          const SizedBox(
                            height: 8,
                          ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                          Flexible(
                            child: TextFormField(
                              controller: _estimatedTimeController,
                              decoration: InputDecoration(
                                hintText: 'Repayment Period',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Can you provide a brief overview of your business, including its products or services?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _businessOverviewController,
                              decoration: InputDecoration(
                                hintText: 'Business Overview',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'What is your business\'s annual revenue and net profit (if applicable)?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _annualRevenueTimeController,
                              decoration: InputDecoration(
                                hintText: 'Annual Revenue',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Do you have any existing loans or outstanding debts related to your business?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _existingLoansController,
                              decoration: InputDecoration(
                                hintText: 'Existing Loans',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Are you willing to provide collateral or a personal guarantee for the loan?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _collateralController,
                              decoration: InputDecoration(
                                hintText: 'Collateral',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          // const Text(
                          //     'Are you willing to provide collateral or a personal guarantee for the loan?'),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          // Flexible(
                          //   child: TextFormField(
                          //     controller: _collateralController,
                          //     decoration: InputDecoration(
                          //       hintText: 'Collateral',
                          //       contentPadding: const EdgeInsets.fromLTRB(
                          //           16.0, 0, 16.0, 0),
                          //
                          //       hintStyle: const TextStyle(
                          //           fontSize: 13, color: Colors.grey),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8.0),
                          //         borderSide: const BorderSide(
                          //           color: Colors.grey,
                          //         ),
                          //       ),
                          //       enabledBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(8.0),
                          //         borderSide: const BorderSide(
                          //           color: Colors.grey,
                          //           width: 1.0,
                          //         ),
                          //       ),
                          //       //fillColor: Colors.green
                          //     ),
                          //     validator: (val) {
                          //       if (val!.length == 0) {
                          //         return "Field cannot be empty";
                          //       } else {
                          //         return null;
                          //       }
                          //     },
                          //     keyboardType: TextInputType.text,
                          //     style: const TextStyle(
                          //       fontFamily: "Poppins",
                          //     ),
                          //   ),
                          // ),]),
                          // const SizedBox(height: 16.0),
                          const Text(
                              'Have you previously applied for a business loan? If yes, please provide details'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _previouslyAppliedController,
                              decoration: InputDecoration(
                                hintText: 'Any Previous Loans',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Can you provide financial statements for your business, such as income statements and balance sheets?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _statementController,
                              decoration: InputDecoration(
                                hintText: 'Financial Statements',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'How many employees do you currently have, and do you plan to hire additional staff with the loan funds?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _employeeNoController,
                              decoration: InputDecoration(
                                hintText: 'Number of Employees',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Are you currently experiencing any financial challenges or legal issues related to your business?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _financialChallengesController,
                              decoration: InputDecoration(
                                hintText: 'Any financil challenges',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Do you have a business plan or strategy for growth and sustainability?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _bplanController,
                              decoration: InputDecoration(
                                hintText: 'Business Plan',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'What sets your business apart from competitors in your industry?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                          Flexible(
                            child: TextFormField(
                              controller: _competitorController,
                              decoration: InputDecoration(
                                hintText: 'Competitor Strategy',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Are you involved in any women-focused or community initiatives?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _womenController,
                              decoration: InputDecoration(
                                hintText: 'Community Initiatives',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'How do you plan to market and promote your business in the future?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _marketingController,
                              decoration: InputDecoration(
                                hintText: 'Marketig Strategy',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const Text(
                              'Can you provide references from clients, suppliers, or partners who can vouch for your business\'s reliability?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _reliabilityController,
                              decoration: InputDecoration(
                                hintText: 'References',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Have you participated in any business or entrepreneurship training programs?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _trainingController,
                              decoration: InputDecoration(
                                hintText: 'Entrepreneurship Programs',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Are you willing to work with a business mentor or advisor, if offered?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                          Flexible(
                            child: TextFormField(
                              controller: _mentorController,
                              decoration: InputDecoration(
                                hintText: 'Willing to work with a mentor?',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          const Text(
                              'Is there any additional information you would like to provide to support your loan application?'),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Flexible(
                            child: TextFormField(
                              controller: _otherInfoController,
                              decoration: InputDecoration(
                                hintText: 'Other Info',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    16.0, 0, 16.0, 0),

                                hintStyle: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
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
                                  return "Field cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  // fontFamily: "Poppins",
                                  ),
                            ),
                          ),]),
                          const SizedBox(height: 16.0),
                          Container(
                            width: MediaQuery.of(context).size.width ,
                            // margin: EdgeInsets.only(
                            //     left: MediaQuery.of(context).size.width *
                            //         0.1),
                            // right: MediaQuery.of(context).size.width * 0.3),
                            child: _isLoading
                                ?  SpinKitCircle(color:
                                Color(0xffed39ca),
                                  )
                                : OutlinedButton(
                                    onPressed: () {
                                      _submitForm();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                            Color(0xffed39ca)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(
                                                    50.0)),
                                      ),
                                    ),
                                    // style: ,
                                    child: const Text('Apply Loan'),
                                  ),
                          ),
                          const SizedBox(height: 16,)
                          ],
                      )),
                ])));

  }
}


