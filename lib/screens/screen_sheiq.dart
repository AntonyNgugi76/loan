import 'dart:convert';
import 'dart:developer';

import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/api_services/api_services.dart';
import 'package:she_banks/screens/colors.dart';
import 'package:she_banks/screens/screen_home.dart';
import 'package:she_banks/screens/sheiq_questions.dart';
import 'package:she_banks/utils/universal_methods.dart';

import '../models/model_user.dart';
import '../utils/db_helper.dart';

final dbhelper = DatabaseHelper();

class ScreenSheIq extends StatefulWidget {
  // ModelUser? user;

  // ScreenSheIq() {
  //   this.user = user;


  _SheIq createState() => _SheIq();
}

const TWO_PI = 3.14 * .6;
List<String> selectedCategory = [];

class _SheIq extends State<ScreenSheIq> {
  List<GlobalKey<FormState>> form_keys = <GlobalKey<FormState>>[];

  bool isLoading = false;
  ApiServices _apiServices = ApiServices();
  int currentForm = 1;
  var active_Form = GlobalKey<FormState>();

  String? paymentPeriodInMonths, loanTaker;
  List<String> selectedCategory7 = [];
  List<Widget> widgets = [];

  static final double containerHeight = 170.0;
  double clipHeight = containerHeight * 0.35;
  DiagonalPosition position = DiagonalPosition.BOTTOM_LEFT;
  final size = 200.0;

  List questions = SheIQquestions().questions;

  PageController _birthdayPageController = PageController(
    initialPage: 0,
    keepPage: false,
  );
  List answers = [];
  String? token;
  String? userId;

  getUser() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token');
      userId = _prefs.getString('userId');
    });

  }

  @override
  void initState() {

    getUser();
    // TODO: implement initState
    super.initState();
    //  upload_to_api();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: FloatingActionButton.extended(
              heroTag: 'btn1',
              backgroundColor: MyColors().primaryColor,
              foregroundColor: Colors.white,
              onPressed: () {
                FocusScope.of(context).unfocus();
                print('CCC  ${currentForm}');

                setState(() {

                });
                //currentForm= currentForm-1;

                previousPage();

              },
              icon: const Icon(
                Icons.arrow_back,
              ),
              label: const Text(
                "prev",
              ),
            ),
          ),
          FloatingActionButton.extended(
            heroTag: 'btn2fluttr',
            backgroundColor: MyColors().primaryColor,
            foregroundColor: Colors.white,
            onPressed: () async {
              FocusScope.of(context).unfocus();
              print('CCC  ${currentForm}');
              if (form_keys[(currentForm - 1)].currentState!.validate()) {
                print('current Form ${currentForm}');
                form_keys[(currentForm - 1)].currentState!.save();

                await dbhelper.select_a_question(currentForm).then((value) {
                  List<Map<dynamic, dynamic>> fields = value;
                  print('AAAA ${value}');

                  if (fields.length == 0) {
                    UniversalMethods.show_toast(
                        'An answer is required for this question', context);
                  } else {
                    if(currentForm == questions.length){
                      upload_to_api();
                    }else {
                      setState(() {
                        nextPage();
                      });

                    }
                  }
                });
              } else {
                UniversalMethods.show_toast('All fields are required', context);
              }
            },
            icon: Icon(
              currentForm == questions.length-1  ? Icons.upload_rounded : Icons.arrow_forward,
            ),
            label: Text(
              currentForm == questions.length-1  ? "save" : "next",
            ),
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          'SheIQ',
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: PageView.builder(
        controller: _birthdayPageController,
        itemCount: questions.length,
        scrollDirection: Axis.horizontal,
        onPageChanged: onchahged,
        physics: const NeverScrollableScrollPhysics(),
        reverse: false,
        itemBuilder: (BuildContext context, int index) {
          final _formKey = GlobalKey<FormState>();
          form_keys.add(_formKey);

          active_Form = _formKey;


          //currentForm = questions[index]['id'];
          print('${currentForm} nnn');

          var type = questions[index]['type'];
          var answer_options = questions[index]['answer_options'];
          var question = questions[index]['question'];
          var current_key = form_keys[index];
          var temp = ((index / questions.length) * 100).toString();
          var arr = temp.split('.');
          var percentage = arr[0];
          var quiz_title = questions[index]['quiz_title'];
          var input_type = questions[index]['input_type'];

          Map<String, dynamic> data = {
            'type': type,
            'answer_options': answer_options,
            'current_key': current_key,
            'percentage': percentage,
            'quiz_title': quiz_title,
            'quiz_id': currentForm,
            'question': question,
            'input_type': input_type,
          };

          return _page(data);

          // return SingleChildScrollView(
          //   child: question(type, answer_options),
          // );
        },
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }


  question_widget(Map<String, dynamic> data) {
    int type = data['type'];
    List items = data['answer_options'];
    var current_key = data['current_key'];
    var quiz_title = data['quiz_title'];
    int quiz_id = data['quiz_id'];
    String question = data['question'];

    int input_type = data['input_type'];
    // print('${input_type} BBBB');

    return FutureBuilder(
        future: get_answers(),
        builder: (context, snapshot) {
          List<Map<String, dynamic>> answers_list = [];
          if (snapshot.hasData) {
            TextEditingController ed = TextEditingController();
            if (type == 1 && snapshot.data != null) {
              List item_list = snapshot.data;
              if (item_list.isNotEmpty) {
                Map<dynamic, dynamic> fields = snapshot.data[0];
                String answer = fields['quiz_answer'];
                ed.text = answer;
              }
            } else {
              selectedCategory7.clear();
              answers_list = snapshot.data;
              answers_list.forEach((element) {
                print(
                    'GGGGGG ${answers_list.length} ${element['quiz_answer']}');
                selectedCategory7.add(element['quiz_answer']);
              });
              //print(answers_list);
            }

            return Form(
                key: current_key,
                child: Column(children: <Widget>[
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
                              "$quiz_title",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${currentForm}. ${question}?",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "* Required",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                  type == 1
                      ? Card(
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
                              "Provide your answer below",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              scrollPadding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .bottom +
                                      36 * 4),
                              decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                                hintText: 'Answer',
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
                              keyboardType: input_type == 1
                                  ? TextInputType.phone
                                  : TextInputType.text,
                              controller: ed,
                              validator: (value) => value.toString().isEmpty
                                  ? "This field is required"
                                  : null,
                              onSaved: (value) {
                                if (value!.isEmpty) {
                                  print('nothing inserted');
                                  return;
                                } else {
                                  print('something inserted');

                                  Map<String, dynamic> data = {
                                    'quiz_id': quiz_id,
                                    'quiz_answer': value,
                                    'answer_index': quiz_id,
                                    'quiz_category_id_fk': 1,
                                  };
                                  dbhelper.insert_row(data);
                                }
                              },
                            ),
                          ],
                        ),
                      ))
                      : ListView.builder(
                      itemCount: items.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var question = items[index];
                        return CheckboxListTile(
                          title: Text('$question'),
                          value: selectedCategory7.contains("$question"),
                          activeColor: Colors.pink,
                          onChanged: (bool? value) {
                            setState(() {
                              //Quiz Table table structure

                              print('FFFF ${question}');
                              var answer_index = ((index + 1) * 100);

                              if (value!) {
                                Map<String, dynamic> data = {
                                  'quiz_id': quiz_id,
                                  'quiz_answer': question,
                                  'answer_index': input_type == 3?quiz_id:answer_index,
                                  'quiz_category_id_fk': 1,
                                };

                                dbhelper.insert_row(data);
                                selectedCategory7.add("$question");
                                print(
                                    "its contains it ? ${selectedCategory7.contains("$question").toString()}");
                              } else {
                                dbhelper
                                    .delete_entry(quiz_id, answer_index)
                                    .then((value) {
                                  print('DDDDDA');
                                  selectedCategory7.remove("$question");
                                  print(
                                      "its contains it ? ${selectedCategory7.contains("$question").toString()}");
                                });
                              }
                            });
                          },
                        );
                      }),
                ]));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Future get_answers() async {
    return await dbhelper.select_a_question(currentForm);
  }

  void nextPage() {
    _birthdayPageController.animateToPage(
        _birthdayPageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn);
  }

  void previousPage() {
    _birthdayPageController.animateToPage(
        _birthdayPageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn);
  }

  Widget _page(Map<String, dynamic> data) {
    var percentage = data['percentage'];

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              isLoading
                  ? LinearProgressIndicator(
                value: (percentage / 100),
                color: Colors.green,
              )
                  : const SizedBox(),
              Diagonal(
                position: position,
                clipHeight: clipHeight,
                child: Container(
                  color: Colors.white,
                  height: containerHeight,
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  top: -100.0,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Questionnaire',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          '$percentage% complete',
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                bottom: -40.0,
                right: 0.0,
                left: 0.0,
                height: 140.0,
                child: AspectRatio(
                  aspectRatio: 300 / 145,
                  child: Container(
                    width: size,
                    height: size,
                    child: Stack(
                      children: [
                        // Center(
                        //   child: ShaderMask(
                        //     shaderCallback: (rect) {
                        //       return SweepGradient(
                        //               startAngle: 0.0,
                        //               endAngle: TWO_PI,
                        //               stops: [0.7, 0.7],
                        //               // 0.0 , 0.5 , 0.5 , 1.0
                        //               center: Alignment.center,
                        //               colors: [Colors.blue, Colors.transparent])
                        //           .createShader(rect);
                        //     },
                        //     child: Container(
                        //       width: size,
                        //       height: size,
                        //       decoration: BoxDecoration(
                        //           shape: BoxShape.circle, color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                        Center(
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                                child: Image.asset(
                                  'assets/images/home with girl_5392465.png',
                                  width: 100,
                                  height: 100,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          question_widget(data),
          const SizedBox(
            height: 160,
          ),
        ],
      ),
    );
  }

  upload_to_api() {

    UniversalMethods().showLoaderDialog(context, 'saving your questioner');

    Map<String, dynamic> all_answers = {};
    for (int i = 0; i < questions.length; i++) {
      Map element = questions[i];

      int id = element['id'];
      String alias = element['alias'];
      int input_type = element['input_type'];
      var default_val;
      dbhelper.select_a_question(id).then((data) {
        List answerera = [];
        data.forEach((element) {
          var answer = element['quiz_answer'];

          print('GGGG ${answer}');
          answerera.add(answer);
        });
        var an;
        if (input_type == 1) {
          //for integer
          if (answerera == null || answerera.isEmpty) {
            an = 0;
          } else {
            an = answerera[0];
          }
          print("VVVV ${an}");
        } else if (input_type == 2) {
          //for string
          if (answerera == null || answerera.isEmpty) {
            an = 'NA';
          } else {
            an = answerera.join(', ') ?? '';
          }
          print("VVVV ${an}");
        } else if (input_type == 3) {
          //for boolean
          if (answerera == null || answerera.isEmpty) {
            an = false;
          } else {
            an = answerera[0];
          }
          print("VVVV ${an}");
        }

        Map<String, dynamic> one_answer = {alias: an};

        all_answers.addAll(one_answer);
        print('ADDDED ${all_answers} ${all_answers.length}');

        var last_element = questions.length - 1;
        print('TWWWo $i BBBBB ${last_element}');
        if (i == last_element) {
          Map<String, dynamic> user_object = {
            // 'userId': widget.user!.userId ?? ''
          };
          all_answers.addAll(user_object);

          Map<String, dynamic> final_answer =
          Map<String, dynamic>.from(all_answers);
          print('THREEs ${final_answer}');
          // _upload_to_server(final_answer);
          Map<String, dynamic> finalData={
            "quiz": final_answer
          };
          // _apiServices.submit_iq(finalData, token!, userId!);


          _upload_to_server(finalData);

        }
      });
      // print('THREE ${all_answers}');
    }
    Navigator.pop(context);

  }

  _upload_to_server( data) async {
    ApiServices().submit_iq(data,token!, userId! ).then((value) {
      print(value);
      if(value.status == 'OK'){
        _showDialog(value.message.toString());

      } else{
        _showDialog(value.message.toString());

      }
      // UniversalMethods.show_toast('FFF', context);
    }).catchError((onError) {
      UniversalMethods.show_toast('Error', context);
    });
  }
  onchahged(int index) {
    setState(() {
      currentForm = index+1;
    });
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
                        // Get.off(()=> Homescreen());
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