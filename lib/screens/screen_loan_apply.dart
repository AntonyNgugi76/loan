// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:she_banks/api_services/api_services.dart';
// import 'package:she_banks/models/loan_types.dart';
// import 'package:she_banks/screens/colors.dart';
// import 'package:she_banks/screens/screen_home.dart';
// import 'package:she_banks/utils/universal_methods.dart';
// import 'package:uuid/uuid.dart';
//
// import '../models/loginModel.dart';
// import '../models/model_loan_status.dart';
// import '../models/model_user.dart';
//
// class FullScreenDialogRequestLoan extends StatefulWidget {
//   // final LoanType loan;
//
//   Loans? loan;
//
//   FullScreenDialogRequestLoan(Loans? loan) {
//     this.loan = loan;
//   }
//
//   FullScreenDialog createState() => FullScreenDialog();
// }
//
// class FullScreenDialog extends State<FullScreenDialogRequestLoan> {
//   // final LoanType loan;
//   static const Color primaryColor = Color.fromRGBO(249, 98, 158, 1.0);
//   final TextEditingController controller_loan_amount = TextEditingController();
//
//   FullScreenDialog();
//
//   String? amountString, dueDate, selectedPeriod;
//
//   double? interest, repaymentAmount = 0.0;
//   double? loan_amount = 0.0;
//   var uuid = Uuid();
//
//
//   @override
//   void initState() {
//     // getProducts();
//     // TODO: implement initState
//     super.initState();
//     var date = DateTime.now();
//     int repayment_period = int.parse(widget.loan!.loanTerm);
//     DateTime date_time2 =
//         DateTime(date.year, date.month, date.day + repayment_period);
//     dueDate = DateFormat('dd-MM-yyyy').format(date_time2);
//
//     //
//     // amountString = widget.loan!.loanCategoryName;
//     // selectedPeriod = widget.loan!.loanRepaymentPeriod;
//     // interest = (widget.loan!.loanInterest * 0.01) *loan_amount!;
//     // repaymentAmount = interest! + loan_amount!;
//     // dueDate =
//     // "${DateTime.now().add(Duration(days: int.parse(loan.CategoryLoanPeriod))).day}/${DateTime.now().add(Duration(days: int.parse(loan.CategoryLoanPeriod))).month}/${DateTime.now().add(Duration(days: int.parse(loan.CategoryLoanPeriod))).year}";
//   }
//
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final myController1 = TextEditingController();
//     Size size = MediaQuery.of(context).size;
//
//     // ModelUser user = Provider.of<ModelUser>(context);
//     ModelLoanStatus loanStatus = Provider.of<ModelLoanStatus>(context);
//     String? string;
//
//     // var mainProvider = Provider.of<MainProvider>(context);
//     updateTextMinus(amount) {
//       if (amount > widget.loan!.minAmount) {
//         setState(() {
//           amountString = amount.toString();
//           interest = widget.loan!.loanInterest * 0.01 * amount;
//           repaymentAmount = (interest! + amount);
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           behavior: SnackBarBehavior.floating,
//           content: Text("minimum amount of loan is 500"),
//         ));
//       }
//     }
//
//     reset_values() {
//       setState(() {
//         // amountString = (amount - 500).toString();
//         interest = 0;
//         repaymentAmount = 0;
//       });
//     }
//
//     // updateTextPlus() {
//     //   int amount = int.parse(amountString);
//     //   print("$amount   and ${int.parse(loan.CategoryLoanAmount)}");
//     //   if (amount < int.parse(loan.CategoryLoanAmount)) {
//     //     setState(() {
//     //       amountString = (amount + 500).toString();
//     //       interest = double.parse(loan.CategoryLoanIntest) *
//     //           0.01 *
//     //           int.parse(amountString);
//     //       repaymentAmount = (interest + int.parse(amountString));
//     //     });
//     //   } else {
//     //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     //       behavior: SnackBarBehavior.floating,
//     //       content: Text("your loan limit is ${loan.CategoryLoanAmount}"),
//     //     ));
//     //   }
//     // }
//
//     // amountString=loan.CategoryLoanAmount;
//
//     return Scaffold(
//         // backgroundColor: primaryColor.withOpacity(.7),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text(
//             'Apply for ${widget.loan!.type}',
//             style: TextStyle(color: Colors.black),
//           ),
//           leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             child: SafeArea(
//               top: true,
//               child: Center(
//                 child: Container(
//                     child: Column(children: <Widget>[
//                   Container(
//                     width: size.width * .97,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 20),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Your loan limit ${UniversalMethods.amount_commas(loanStatus.loanLimit.toString() ?? "0")} ksh',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     ?.copyWith(
//                                         color: Colors.black,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 32,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 20, top: 10),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Minimum amount is ${UniversalMethods.amount_commas(widget.loan!.minAmount.toString())} ksh",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     ?.copyWith(
//                                       color: Colors.black45,
//                                       fontSize: 13,
//                                     ),
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         //   children: [
//                         //     OutlinedButton(
//                         //       onPressed: (){
//                         //
//                         //       },
//                         //       child: Icon(Icons.remove),
//                         //     ),
//                         //     Text("${loanStatus.loanLimit??0}",
//                         //         style: Theme.of(context)
//                         //             .textTheme
//                         //             .headline5
//                         //             ?.copyWith(
//                         //             color: Colors.black,
//                         //             fontWeight: FontWeight.bold)),
//                         //     OutlinedButton(
//                         //       onPressed: (){},
//                         //       child: Icon(Icons.add),
//                         //     ),
//                         //   ],
//                         // ),
//
//                         Padding(
//                           padding: EdgeInsets.only(left: 20, right: 20),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Flexible(
//                                 child: TextFormField(
//                                   controller: controller_loan_amount,
//                                   decoration: new InputDecoration(
//                                     hintText: 'Enter loan amount',
//                                     contentPadding:
//                                         EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
//                                     hintStyle: TextStyle(
//                                         fontSize: 13, color: Colors.grey),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       borderSide: BorderSide(
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       borderSide: BorderSide(
//                                         color: Colors.grey,
//                                         width: 1.0,
//                                       ),
//                                     ),
//                                     //fillColor: Colors.green
//                                   ),
//                                   onChanged: (text) {
//                                     if (text.length > 0) {
//                                       text = UniversalMethods.amount_commas(
//                                         text.replaceAll(',', ''),
//                                       );
//
//                                       controller_loan_amount.value =
//                                           TextEditingValue(
//                                         text: text,
//                                         selection: TextSelection.collapsed(
//                                           offset: text.length,
//                                         ),
//                                       );
//
//                                       int x =
//                                           int.parse(text.replaceAll(',', ''));
//
//                                       print(x);
//                                       print(widget.loan!.minAmount);
//                                       if (x > widget.loan!.minAmount) {
//                                         updateTextMinus(x);
//                                       } else {
//                                         reset_values();
//                                       }
//                                     }
//                                   },
//                                   validator: (val) {
//                                     if (val!.length == 0) {
//                                       return "Phone number be empty";
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                   keyboardType: TextInputType.phone,
//                                   style: new TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         // Row(
//                         //   children: [
//                         //     Padding(
//                         //       padding: EdgeInsets.only( left: 20,),
//                         //       child: Text(
//                         //         "Loan duration",
//                         //         style: Theme.of(context)
//                         //             .textTheme
//                         //             .headline6
//                         //             ?.copyWith(
//                         //             color: Colors.grey,
//                         //             fontSize: 14,
//                         //             fontWeight: FontWeight.w500),
//                         //       ),
//                         //     ),
//                         //     Padding(
//                         //       padding: EdgeInsets.only(top: 8),
//                         //       child: Text(
//                         //         "${widget.loan!.loanRepaymentPeriod} days",
//                         //         style: TextStyle(
//                         //             fontSize: 18, fontWeight: FontWeight.bold),
//                         //       ),
//                         //     ),
//                         //   ],
//                         // ),
//                         SizedBox(
//                           height: 100,
//                         ),
//                         Column(
//                           children: [],
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 20, top: 30),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Reckoning",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     ?.copyWith(
//                                         color: Colors.black,
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               EdgeInsets.only(top: 20, left: 20, right: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                   child: Text("Loan duration",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline6
//                                           ?.copyWith(
//                                               color: Colors.black45,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold))),
//                               Expanded(
//                                   child: Text(
//                                 "${widget.loan!.loanTerm} days",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     ?.copyWith(
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.end,
//                               ))
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               EdgeInsets.only(top: 10, left: 20, right: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                   child: Text("Interest",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline6
//                                           ?.copyWith(
//                                               color: Colors.black45,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold))),
//                               Expanded(
//                                   child: Text(
//                                 "${UniversalMethods.amount_commas(interest?.toInt())} ksh",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     ?.copyWith(
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.end,
//                               ))
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               EdgeInsets.only(top: 10, left: 20, right: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                   child: Text("Repayment amount",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline6
//                                           ?.copyWith(
//                                               color: Colors.black45,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold))),
//                               Expanded(
//                                   child: Text(
//                                 "${UniversalMethods.amount_commas(repaymentAmount!.toInt())} Ksh",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     ?.copyWith(
//
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.end,
//                               ))
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               EdgeInsets.only(top: 10, left: 20, right: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                   child: Text("Due date",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline6
//                                           ?.copyWith(
//                                               color: Colors.black45,
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.bold))),
//                               Expanded(
//                                   child: Text(
//                                 "${dueDate}",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline6
//                                     ?.copyWith(
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                 textAlign: TextAlign.end,
//                               ))
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 50,
//                         ),
//                         OutlinedButton(
//                           onPressed: () async {
//                             // Navigator.of(context).pushReplacement(
//                             //   MaterialPageRoute(
//                             //     builder: (BuildContext context) => Homescreen(),
//                             //   ),
//                             // );
//
//                             if (controller_loan_amount.text.isEmpty) {
//                               FocusScope.of(context).unfocus();
//                               UniversalMethods.show_toast(
//                                   'Loan amount is required', context);
//                               return;
//                             }
//
//                             int amount = int.parse(controller_loan_amount.text
//                                 .replaceAll(',', ''));
//
//                             if (amount < widget.loan!.minAmount) {
//                               FocusScope.of(context).unfocus();
//                               UniversalMethods.show_toast(
//                                   'Enter a value greater that ${widget.loan!.minAmount}',
//                                   context);
//                               return;
//                             }
//
//                             if (amountString!.isEmpty) {
//                               FocusScope.of(context).unfocus();
//                               UniversalMethods.show_toast(
//                                   'Loan amount is required', context);
//                               return;
//                             }
//
//                             UniversalMethods()
//                                 .showLoaderDialog(context, 'Submiting loan');
//                             Map body = {
//                               // 'user': user.mobileNumber,
//                               'category': widget.loan!.type,
//                               'amount': amountString,
//                               'loan_code': 'Afdhjjyrd',
//                             };
//
//                             print(body);
//
//                             Map response =
//                                 await ApiServices().submit_loan(body);
//                             print(response);
//                             if (!response['error']) {
//                               UniversalMethods.show_toast(
//                                   response['message'], context);
//                               Navigator.pop(context);
//
//                               // Navigator.pushAndRemoveUntil<dynamic>(
//                               //   context,
//                                 // MaterialPageRoute<dynamic>(
//                                 //   builder: (BuildContext context) => Homescreen(),
//                                 // ),
//                                 //     (route) => false,//if you want to disable back feature set to false
//                               // );
//
//                               // Navigator.of(context).pushReplacement(
//                               //   MaterialPageRoute(
//                               //     builder: (BuildContext context) =>
//                               //         Homescreen(),
//                               //   ),
//                               // );
//                             } else {
//                               UniversalMethods.show_toast(
//                                   response['message'], context);
//                               Navigator.pop(context);
//                             }
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 MyColors().primaryColor),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50.0)),
//                             ),
//                           ),
//                           child: const Text(
//                             "SUBMIT LOAN APPLICATION",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         // GestureDetector(
//                         //   onTap: () async {
//                         //     // final prefs =
//                         //     // await SharedPreferences.getInstance();
//                         //     //
//                         //     // String phone = prefs.getString("phone");
//                         //     // setState(() {
//                         //     //   isLoading = true;
//                         //     // });
//                         //     // Future<Map<String, dynamic>> requestData =
//                         //     // mainProvider.applyLoan(
//                         //     //     "$phone#${loan.CategoryLoanName}#${loan.CategoryLoanAmount}#");
//                         //     // requestData.then((value) => {
//                         //     //   setState(() {
//                         //     //     isLoading = false;
//                         //     //   }),
//                         //     //   if (value['status'] == 200)
//                         //     //     {
//                         //     //       ScaffoldMessenger.of(context)
//                         //     //           .showSnackBar(SnackBar(
//                         //     //         behavior: SnackBarBehavior.floating,
//                         //     //         content: Text("successfully applied"),
//                         //     //       )),
//                         //     //       Navigator.of(context).pop()
//                         //     //     }
//                         //     //   else
//                         //     //     {
//                         //     //       print(value.toString()),
//                         //     //       print(
//                         //     //           "error value is ${value["body"]}"),
//                         //     //       ScaffoldMessenger.of(context)
//                         //     //           .showSnackBar(SnackBar(
//                         //     //         behavior: SnackBarBehavior.floating,
//                         //     //         content:
//                         //     //         Text("userdata['Description']"),
//                         //     //       )),
//                         //     //       Navigator.of(context).pop()
//                         //     //     }
//                         //     // });
//                         //   },
//                         //   child: Padding(
//                         //     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                         //     child: Padding(
//                         //       padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         //       child: Container(
//                         //         height: 40.0,
//                         //         child: Material(
//                         //           borderRadius: BorderRadius.circular(20.0),
//                         //           shadowColor: primaryColor,
//                         //           color: primaryColor,
//                         //           elevation: 7.0,
//                         //           child: Center(
//                         //             child: isLoading == true
//                         //                 ? CircularProgressIndicator(
//                         //               color: Colors.white,
//                         //             )
//                         //                 : Text(
//                         //               'APPLY FOR LOAN',
//                         //               style: TextStyle(
//                         //                   fontWeight: FontWeight.bold,
//                         //                   color: Colors.white),
//                         //             ),
//                         //           ),
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   )
//                 ])),
//               ),
//             ),
//           ),
//         ));
//   }
//
//
// }
