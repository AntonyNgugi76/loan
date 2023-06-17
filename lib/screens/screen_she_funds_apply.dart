import 'dart:convert';
import 'dart:io';
import 'dart:math';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/screens/screen_she_funds.dart';
import 'package:she_banks/utils/universal_methods.dart';

import '../api_services/api_services.dart';
import '../models/model_user.dart';
import 'colors.dart';

class AddSeed extends StatefulWidget {
  AddSeed();

  _AddSeedState createState() => _AddSeedState();
}

class _AddSeedState extends State<AddSeed> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  final aboutController = TextEditingController();
  final sectorsController = TextEditingController();
  final founderController = TextEditingController();
  final bridgingController = TextEditingController();
  final problemController = TextEditingController();
  final impactController = TextEditingController();
  final marketingController = TextEditingController();
  final stemInitiativeController = TextEditingController();
  final transactonController = TextEditingController();
  final sdgController = TextEditingController();
  final tellusController = TextEditingController();
  final anyOtherinfoController = TextEditingController();

  var countryCode = "+254";
  var _usercountry = "Kenya";
  final formKey = GlobalKey<FormState>();
  Future<bool>? _futureAlbum;
  String? phone,
      projectBudgetUrl,
      shareCapital,
      jointStatment,
      taxAdmin,
      financialStatments,
      id,
      applicationId = "2021",
      growthLevelString = "Start-up",
      videoStatements;
  bool budgetLoading = false,
      capitalLoading = false,
      jointLoading = false,
      taxLoading = false,
      financialLoading = false,
      pathsLoading = false,
      videoLoading = false;

  TextEditingController _controller = TextEditingController();
  var _token;
  var _userId;
  getTokenUser() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
   setState(() {
     _token = _prefs.getString('token');
     _userId= _prefs.getString('userId');
   });


  }

  @override
  void initState() {
    getTokenUser();
    // TODO: implement initState
    super.initState();
    // Firebase.initializeApp();
    // pr = new ProgressDialog(context,
    //     type: ProgressDialogType.Normal, isDismissible: true);
    // pr.style(message: 'Processing...');
    // _controller.addListener(() => _extension = _controller.text);

    var rnd = Random();
    var next = rnd.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    id = next.toInt().toString();
  }

  List<int> someList = [1, 2, 3, 4, 5];
  List<String> selectedCategories = [];
  List<String> selectedCategories2 = [];
  var isOtherEnabled2 = false;
  var isOtherEnabled = false;
  bool isLoading= false;
  var isWomanOwned = 1;
  var fundraised = 1;
  var generatingRevenue = 1;
  var growthLevel = 0;

  @override
  Widget build(BuildContext context) {
    // ModelUser user = Provider.of<ModelUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Apply seed fund",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xfff6e0e0),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Center(
            child: Column(
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Seed fund application",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Are you a startup looking for a seed fund? Miss.Africa Digital is aimed at supporting startups on their journey to a successful start-up.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "* Required",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),

                        // Card(
                        //     margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        //     elevation: 0.9,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(10.0))),
                        //     child: Padding(
                        //       padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        //       child: Center(
                        //         child: Image(
                        //             image:
                        //                 AssetImage('assets/images/0003.jpg')),
                        //       ),
                        //     )),

                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(),
                                      text:
                                          "Tell us about your organization or Project (Applicant expected to give the name, size, current residence and any other information)",
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    controller: aboutController,
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    decoration: const InputDecoration(
                                        hintText: "Enter Business about"),
                                  )
                                ],
                              ),
                            )),
                        //okay 1
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(),
                                      text:
                                          "Who is the trusted founder(s) or Leader? (Please include phone number and email address and separate eact founder by comma)",
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    controller: founderController,
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    decoration: const InputDecoration(
                                        hintText:
                                            "Who is the trusted founder(s) or Leader? (Please include phone number and email address)"),
                                  )
                                ],
                              ),
                            )),
                        //okay2
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(),
                                      text:
                                          "Which sector does your business operate in(Please fill multiple if necessary) ?",
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Education'),
                                    value: selectedCategories
                                        .contains("Education"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories.add("Education");
                                        } else {
                                          selectedCategories
                                              .remove("Education");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Building and Construction'),
                                    value: selectedCategories
                                        .contains("Building and Construction"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories
                                              .add("Building and Construction");
                                        } else {
                                          selectedCategories.remove(
                                              "Building and Construction");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Banking and finance'),
                                    value: selectedCategories
                                        .contains("Banking and finance"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories
                                              .add("Banking and finance");
                                        } else {
                                          selectedCategories
                                              .remove("Banking and finance");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Agriculture'),
                                    value: selectedCategories
                                        .contains("Agriculture"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories.add("Agriculture");
                                        } else {
                                          selectedCategories
                                              .remove("Agriculture");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('E-commerce'),
                                    value: selectedCategories
                                        .contains("E-commerce"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories.add("E-commerce");
                                        } else {
                                          selectedCategories
                                              .remove("E-commerce");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Health'),
                                    value:
                                        selectedCategories.contains("Health"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories.add("Health");
                                        } else {
                                          selectedCategories.remove("Health");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Internet of things'),
                                    value: selectedCategories
                                        .contains("Internet of things"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories
                                              .add("Internet of things");
                                        } else {
                                          selectedCategories
                                              .remove("Internet of things");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Manufacturing'),
                                    value: selectedCategories
                                        .contains("Manufacturing"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories
                                              .add("Manufacturing");
                                        } else {
                                          selectedCategories
                                              .remove("Manufacturing");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Service'),
                                    value:
                                        selectedCategories.contains("Service"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories.add("Service");
                                        } else {
                                          selectedCategories.remove("Service");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    title: const Text('Others'),
                                    value: isOtherEnabled,
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isOtherEnabled = value!;
                                      });
                                    },
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, right: 20),
                                      child: TextFormField(
                                        controller: sectorsController,
                                        validator: (value) => isOtherEnabled
                                            ? value!.isEmpty
                                                ? "this field is required"
                                                : null
                                            : null,
                                        enabled: isOtherEnabled,
                                        decoration: const InputDecoration(
                                          labelText:
                                              'Enter others here(seperate wtih comma)',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF6200EE)),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            )),
                        //okay3
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Women owned? ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(),
                                      ),
                                      Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.red),
                                      )
                                    ],
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.only(left: 0),
                                    title: Text(
                                      'Yes',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: isWomanOwned,
                                      onChanged: (int? value) {
                                        setState(
                                          () {
                                            isWomanOwned = value!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding:
                                        const EdgeInsets.only(left: 0, top: 0),
                                    title: Text(
                                      'No',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    leading: Radio(
                                      value: 0,
                                      groupValue: isWomanOwned,
                                      onChanged: (int? value) {
                                        setState(() {
                                          isWomanOwned = value!;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )),
                        //okay4
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(),
                                      text:
                                          "How is your business/project involved in bridging the gender gap of women in STEM?",
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    controller: bridgingController,
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    decoration: const InputDecoration(
                                        hintText: "Enter here"),
                                  )
                                ],
                              ),
                            )),
                        //okay5 not complete
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "What problem/community need are you addressing?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(),
                                        ),
                                      ),
                                      Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.red),
                                      )
                                    ],
                                  ),
                                  TextFormField(
                                    controller: problemController,
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    decoration: const InputDecoration(
                                        hintText: "Enter here"),
                                  )
                                ],
                              ),
                            )),
                        //okay6 not complete
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "How will you measure impact?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(),
                                      ),
                                      Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.red),
                                      )
                                    ],
                                  ),
                                  TextFormField(
                                    controller: impactController,
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    decoration: const InputDecoration(
                                        hintText: "Enter here"),
                                  )
                                ],
                              ),
                            )),
                        //okay7
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(),
                                      text:
                                          "Which SDGs are you primarily targeting? (Please fill multiple if necessary) ?",
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  CheckboxListTile(
                                    title: const Text('No poverty'),
                                    value: selectedCategories2
                                        .contains("No poverty"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2.add("No poverty");
                                        } else {
                                          selectedCategories2
                                              .remove("No poverty");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Zero Hunger'),
                                    value: selectedCategories2
                                        .contains("Zero Hunger"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2
                                              .add("Zero Hunger");
                                        } else {
                                          selectedCategories2
                                              .remove("Zero Hunger");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Good health and wellbeing'),
                                    value: selectedCategories2
                                        .contains("Good health and wellbeing"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2
                                              .add("Good health and wellbeing");
                                        } else {
                                          selectedCategories2.remove(
                                              "Good health and wellbeing");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Quality Education'),
                                    value: selectedCategories2
                                        .contains("Quality Education"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2
                                              .add("Quality Education");
                                        } else {
                                          selectedCategories2
                                              .remove("Quality Education");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Gender Equality'),
                                    value: selectedCategories2
                                        .contains("Gender Equality"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2
                                              .add("Gender Equality");
                                        } else {
                                          selectedCategories2
                                              .remove("Gender Equality");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Clean water and Sanitation'),
                                    value: selectedCategories2
                                        .contains("Clean water and Sanitation"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2.add(
                                              "Clean water and Sanitation");
                                        } else {
                                          selectedCategories2.remove(
                                              "Clean water and Sanitation");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Affordable and Clean energy'),
                                    value: selectedCategories2.contains(
                                        "Affordable and Clean energy"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2.add(
                                              "Affordable and Clean energy");
                                        } else {
                                          selectedCategories2.remove(
                                              "Affordable and Clean energy");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title:
                                        const Text('Decent work and Economic growth'),
                                    value: selectedCategories2.contains(
                                        "Decent work and Economic growth"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2.add(
                                              "Decent work and Economic growth");
                                        } else {
                                          selectedCategories2.remove(
                                              "Decent work and Economic growth");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text(
                                        'Industry,Innovation and Infrastructure'),
                                    value: selectedCategories2.contains(
                                        "Industry,Innovation and Infrastructure"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2.add(
                                              "Industry,Innovation and Infrastructure");
                                        } else {
                                          selectedCategories2.remove(
                                              "Industry,Innovation and Infrastructure");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Reduced Inequalities'),
                                    value: selectedCategories2
                                        .contains("Reduced Inequalities"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2
                                              .add("Reduced Inequalities");
                                        } else {
                                          selectedCategories2
                                              .remove("Reduced Inequalities");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text(
                                        'Sustainable cities and Communities'),
                                    value: selectedCategories2.contains(
                                        "Sustainable cities and Communities"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2.add(
                                              "Sustainable cities and Communities");
                                        } else {
                                          selectedCategories2.remove(
                                              "Sustainable cities and Communities");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text(
                                        'Responsible Consumption and Production'),
                                    value: selectedCategories2.contains(
                                        "Responsible Consumption and Production"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2.add(
                                              "Responsible Consumption and Production");
                                        } else {
                                          selectedCategories2.remove(
                                              "Responsible Consumption and Production");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Climate Action'),
                                    value: selectedCategories2
                                        .contains("Climate Action"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2
                                              .add("Climate Action");
                                        } else {
                                          selectedCategories2
                                              .remove("Climate Action");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: const Text(
                                        'Peace,Justice and Strong Institutions'),
                                    value: selectedCategories2.contains(
                                        "Peace,Justice and Strong Institutions"),
                                    activeColor: const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedCategories2.add(
                                              "Peace,Justice and Strong Institutions");
                                        } else {
                                          selectedCategories2.remove(
                                              "Peace,Justice and Strong Institutions");
                                        }
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    title: const Text('Others'),
                                    value: isOtherEnabled2,
                                    activeColor:const Color(0xffed39ca),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isOtherEnabled2 = value!;
                                      });
                                    },
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20, right: 20),
                                      child: TextFormField(
                                        controller: sdgController,
                                        validator: (value) => isOtherEnabled2
                                            ? value!.isEmpty
                                                ? "this field is required"
                                                : null
                                            : null,
                                        enabled: isOtherEnabled,
                                        decoration: const InputDecoration(
                                          labelText: 'Enter others here',
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF6200EE)),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            )),
                        //okay8 not complete
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(),
                                      text:
                                          "How does your business/project market or plan to market its products and services?",
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    controller: marketingController,
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    decoration: const InputDecoration(
                                        hintText: "Enter here"),
                                  )
                                ],
                              ),
                            )),
                        //okay9 not complete
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Any major STEM initiative milestones achieved?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(),
                                        ),
                                      ),
                                      Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.red),
                                      )
                                    ],
                                  ),
                                  TextFormField(
                                    controller: stemInitiativeController,
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    decoration: const InputDecoration(
                                        hintText: "Enter here"),
                                  )
                                ],
                              ),
                            )),
                        //okay10 not complete
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(),
                                      text:
                                          "Do you have a proven traction? (Some customers, generating revenue, app downloads etc)",
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    controller: transactonController,
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    decoration: const InputDecoration(
                                        hintText: "Enter here"),
                                  )
                                ],
                              ),
                            )),
                        //okay11
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Fundraised before? ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(),
                                      ),
                                      Text(
                                        "*",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.red),
                                      )
                                    ],
                                  ),
                                  ListTile(
                                    contentPadding: const EdgeInsets.only(left: 0),
                                    title: Text(
                                      'Yes',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: fundraised,
                                      onChanged: (int? value) {
                                        setState(() {
                                          fundraised = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding:
                                        const EdgeInsets.only(left: 0, top: 0),
                                    title: Text(
                                      'No',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    leading: Radio(
                                      value: 0,
                                      groupValue: fundraised,
                                      onChanged: (int? value) {
                                        setState(() {
                                          fundraised = value!;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )),
                        //okay12
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Tell us why we should fund you.",
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    validator: (value) => value!.isEmpty
                                        ? "This field is required"
                                        : null,
                                    controller: tellusController,
                                    decoration: const InputDecoration(
                                        hintText: "Enter Answer"),
                                  )
                                ],
                              ),
                            )),
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: FormBuilder(
                                key: _formKey1,
                                child: Column(
                                  children: [
                                    const Text('Attach the following documents either as .docx, pdf,  or png'),
                                    FormBuilderTextField(
                                      name: 'businessPlan',
                                      decoration: const InputDecoration(labelText: 'Business Plan'),
                                      // validator: FormBuilderValidators.required(context),
                                    ),
                                    FormBuilderFilePicker(
                                      name: 'businessPlan',
                                      decoration: const InputDecoration(labelText: 'Business plan'),
                                      // maxFiles: 3, // Maximum number of attachments allowed
                                      previewImages: true, // Display image previews
                                      onChanged: (value) {
                                        print(value);
                                      },
                                      // selectorButtonOnErrorText: 'Add attachments',
                                    ),
                                    FormBuilderTextField(
                                      name: 'financialStatement',
                                      decoration: const InputDecoration(labelText: 'Financial Statement'),
                                      // validator: FormBuilderValidators.required(context),
                                    ),
                                    FormBuilderFilePicker(
                                      name: 'financialStatement',
                                      decoration: const InputDecoration(labelText: 'Financial Statement'),
                                      // maxFiles: 3, // Maximum number of attachments allowed
                                      previewImages: true, // Display image previews
                                      onChanged: (value) {
                                        print(value);
                                      },
                                      // selectorButtonOnErrorText: 'Add attachments',
                                    ),
                                    FormBuilderTextField(
                                      name: 'taxAdminCertificate',
                                      decoration: const InputDecoration(labelText: 'Tax Compliance Certificate'),
                                      // validator: FormBuilderValidators.required(context),
                                    ),
                                    FormBuilderFilePicker(
                                      name: 'taxAdminCertificate',
                                      decoration: const InputDecoration(labelText: 'Tax Compliance Certificate'),
                                      // maxFiles: 3, // Maximum number of attachments allowed
                                      previewImages: true, // Display image previews
                                      onChanged: (value) {
                                        print(value);
                                      },
                                      // selectorButtonOnErrorText: 'Add attachments',
                                    ),
                                    FormBuilderTextField(
                                      name: 'applicantCoinvestorStmt',
                                      decoration: const InputDecoration(labelText: 'Applicant Coinvester Statement'),
                                      // validator: FormBuilderValidators.required(context),
                                    ),
                                    FormBuilderFilePicker(
                                      name: 'applicantCoinvestorStmt',
                                      decoration: const InputDecoration(labelText: 'Applicant Coinvester Statement'),
                                      // maxFiles: 3, // Maximum number of attachments allowed
                                      previewImages: true, // Display image previews
                                      onChanged: (value) {
                                        print(value);
                                      },
                                      // selectorButtonOnErrorText: 'Add attachments',
                                    ),
                                    // SizedBox(height: 20),
                                    // ElevatedButton(
                                    //   onPressed: () {
                                    //     if (_formKey.currentState!.saveAndValidate()) {
                                    //       final formData = _formKey.currentState!.value;
                                    //       // Process the form data here
                                    //       print(formData);
                                    //     }
                                    //   },
                                    //   child: Text('Submit'),
                                    // ),
                                  ],
                                ),
                              ),
                            )),
                        // Card(
                        //     margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        //     elevation: 0.9,
                        //     shape: const RoundedRectangleBorder(
                        //         borderRadius:
                        //             BorderRadius.all(Radius.circular(10.0))),
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(
                        //           left: 20, right: 20, top: 30, bottom: 30),
                        //       child: FormBuilder(
                        //         key: _formKey1,
                        //         child: Column(
                        //           children: [
                        //             FormBuilderTextField(
                        //               name: 'Financial Statement',
                        //               decoration: InputDecoration(labelText: 'Name'),
                        //               // validator: FormBuilderValidators.required(context),
                        //             ),
                        //             FormBuilderFilePicker(
                        //               name: 'fStatement',
                        //               decoration: InputDecoration(labelText: 'Attachments'),
                        //               maxFiles: 3, // Maximum number of attachments allowed
                        //               previewImages: true, // Display image previews
                        //               onChanged: (value) {
                        //                 print(value);
                        //               },
                        //               // selectorButtonOnErrorText: 'Add attachments',
                        //             ),
                        //             // SizedBox(height: 20),
                        //             // ElevatedButton(
                        //             //   onPressed: () {
                        //             //     if (_formKey.currentState!.saveAndValidate()) {
                        //             //       final formData = _formKey.currentState!.value;
                        //             //       // Process the form data here
                        //             //       print(formData);
                        //             //     }
                        //             //   },
                        //             //   child: Text('Submit'),
                        //             // ),
                        //           ],
                        //         ),
                        //       ),
                        //     )),
                        Card(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            elevation: 0.9,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Any other information",
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: anyOtherinfoController,
                                    decoration: const InputDecoration(
                                        hintText: "Enter Answer"),
                                  )
                                ],
                              ),
                            ))
                      ],
                    )),
                GestureDetector(
                  onTap: () async {
                    _successDialog('Your Shefund Application has been submitted Successfully');

                    UniversalMethods.show_toast('Submitted Successfully', context);

                    // final form =
                    //
                    //
                    // _formKey.currentState!;
                    // // if (form.validate()) {
                    // //   form.save();
                    //
                    //   FocusScope.of(context).unfocus();
                    //   List<String> finalSectors = [];
                    //   List<String> finalTarget = [];
                    //   List<String> othersAttachment = [];
                    //   finalSectors.addAll(transactonController.text.split(','));
                    //   finalTarget.addAll(anyOtherinfoController.text.split(','));
                    //   finalTarget.addAll(selectedCategories2);
                    //   finalSectors.addAll(selectedCategories);
                    //
                    //   final finaData = {
                    //     // "username": email,
                    //     // "name": myController1.text,
                    //     "about": aboutController.text,
                    //     "impact": impactController.text,
                    //     "problems": problemController.text,
                    //     "bridging": bridgingController.text,
                    //     // "email": email,
                    //     "founders": founderController.text.split(','),
                    //     // "number": myController4.text,
                    //     "womanOwned": isWomanOwned == 1,
                    //     "sectors": finalSectors,
                    //     "marketing": marketingController.text,
                    //     "primaryTarget": finalTarget,
                    //     "provenTransaction": transactonController.text,
                    //     "reason": tellusController.text,
                    //     "fundraised": fundraised == 1,
                    //     "stemInitiative": stemInitiativeController.text,
                    //     // "attachments": formData['attachments'],
                    //     "otherInfo": anyOtherinfoController.text
                    //   };
                    //   print(finaData.toString());
                    //
                    //   ApiServices().applySeedFund(_userId,finaData, _token).then((value) {
                    //     print('SeedValue>>>>>>${value.toString()}');
                    //     UniversalMethods.show_toast('${value.message.toString()}', context);
                    //     if(value.status=="OK"){
                    //       Get.offAll(()=>ScreenSheFunds());
                    //     }
                    //   });
                    //
                    //   print(finaData);
                    //
                    // // } else {
                    //   print("The form is invalid");
                    // UniversalMethods.show_toast('Fill all fields', context);
                    }
                  //  Navigator.of(context).pop();
                  // },,
                  ,child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: const Color(0xffed39ca),
                          color: const Color(0xffed39ca),
                          elevation: 7.0,
                          child: const Center(
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
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
                        Navigator.of(context).pop();
                        // push(MaterialPageRoute(
                        // builder: (context) => Homescreen()));
                      },
                      child: const Text('Ok'))
                ])),
          );
        });
  }
}
