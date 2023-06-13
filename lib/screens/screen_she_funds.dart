import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/api_services/api_services.dart';
import 'package:she_banks/screens/screen_she_funds_apply.dart';

class ScreenSheFunds extends StatefulWidget {
  @override
  State<ScreenSheFunds> createState() => _ScreenSheFundsState();
}

class _ScreenSheFundsState extends State<ScreenSheFunds> {
  final ApiServices _apiServices = ApiServices();
  bool seedFundOpen = true;
  var token;
  var userId;

  getTokenUID() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    setState(() {
      token = _prefs.getString('token');
      userId = _prefs.getString('userId');
    });
  }

  @override
  void initState() {
    getTokenUID();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    // final bool todo = ModalRoute.of(context).settings.arguments;
    // AuthProvider auth = Provider.of<AuthProvider>(context);
    // int counter = 1;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "SHEFunds",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: seedFundOpen == false
            ? Center(
                child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Image.asset("assets/images/closed.png"),
                    const Text(
                      'The seedfund application has been closed, Wait for the next seedfund to open',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ))
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: SafeArea(
                  top: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddSeed(),
                                  ),
                                );

                                // if (!seedFundOpen &&
                                //     !hasNotAppliedBefore) {
                                //   final snackBar = SnackBar(
                                //     behavior: SnackBarBehavior.floating,
                                //     content: Text(
                                //         'The seedfund application has been closed,Wait for the next seedfund to open'),
                                //     duration: Duration(seconds: 4),
                                //   );
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(snackBar);
                                //   return;
                                // }
                                // if (hasNotAppliedBefore) {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => AddSeed(
                                //           onSuccesfull: (bool) {
                                //             print(
                                //                 "the value is $bool");
                                //             setState(() {
                                //               isLoading = true;
                                //             });
                                //             getData()
                                //                 .then((value) => {
                                //               setState(() {
                                //                 if (value) {
                                //                   isLoading =
                                //                   false;
                                //                 } else {
                                //                   isLoading =
                                //                   false;
                                //                 }
                                //               })
                                //             });
                                //           },
                                //         )),
                                //   );
                                // } else {
                                //   final snackBar = SnackBar(
                                //     behavior: SnackBarBehavior.floating,
                                //     content: Text(
                                //         'You already have an active seedfund application'),
                                //     duration: Duration(seconds: 3),
                                //   );
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(snackBar);
                                // }
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          constraints: const BoxConstraints(
                                              minWidth: 100, maxWidth: 150),
                                          child: const Text(
                                            'Apply for seed fund',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            constraints: const BoxConstraints(
                                                minWidth: 100, maxWidth: 150),
                                            child: const Text(
                                              'View active SHEfunds inorder to receive funding for projects',
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )),
                                      ],
                                    )),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Image.asset(
                                        'assets/images/rising_trend_of_money_funds.png',
                                        fit: BoxFit.fill,
                                        width: 140,
                                        height: 140,
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: GestureDetector(
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'View progress',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            constraints: const BoxConstraints(
                                                minWidth: 100, maxWidth: 150),
                                            child: const Text(
                                              'View how your seedfund application is fairing on',
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )),
                                      ],
                                    )),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Image.asset(
                                        'assets/images/team_5356575.png',
                                        fit: BoxFit.fill,
                                        width: 140,
                                        height: 140,
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            debugPrint('token is>>>>>$token');
                            debugPrint('userId is>>>>>$userId');

                            _apiServices
                                .checkSeedProgress(userId, token)
                                .then((value) {
                                  debugPrint('SeedProgress Value>>>${value.message.toString()}');
                                  if(value.status == "OK"){
                                    _showDialog(value.message.toString());
                                  }
                                  else{
                                    _showDialog(value.message.toString());
                                  }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Recent Winners',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                      ),
                      // Padding(
                      //     padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      //     child: ListView.builder(
                      //       shrinkWrap: true,
                      //       physics: NeverScrollableScrollPhysics(),
                      //       itemCount: _recent.length,
                      //       itemBuilder: _buildItemsForListViewRecent,
                      //     )),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ));
  }
  void _showDialog(String message){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.height*0.27,

        child: Column(
          children: [
            SizedBox(height: 24,),

            Icon(Icons.warning_amber_rounded, size: 50, color: Colors.pink.shade300,),
            SizedBox(height: 24,),
            Text(message),
          SizedBox(height: 24,),
          OutlinedButton(onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Ok'))

          ]

        )),
      );

    });
  }
}
