import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/models/banner.dart';
import 'package:she_banks/screens/BannerWidget.dart';
import 'package:she_banks/screens/TextBannerWidget.dart';
import 'package:she_banks/screens/colors.dart';
import 'package:she_banks/screens/loginPass.dart';
import 'package:she_banks/screens/restart_widget.dart';
import 'package:she_banks/screens/screen_changePassword.dart';
import 'package:she_banks/screens/screen_edit_profile.dart';
import 'package:she_banks/screens/screen_help_center.dart';
import 'package:she_banks/screens/screen_terms.dart';

import '../api_services/api_services.dart';
import '../models/model_loan_status.dart';
import '../models/model_user.dart';
import '../utils/universal_methods.dart';

class ScreenMyAccount extends StatefulWidget {
  final fName;

  final lName;

  final phone;

  final token;

  final email;

  final userId;

  const ScreenMyAccount(
      {super.key,
      required this.fName,
      required this.lName,
      required this.phone,
      required this.token,
      required this.email,
      required this.userId});

  @override
  State<ScreenMyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<ScreenMyAccount> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  double currentPage = 0;

  setUserExists() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    // _prefs.setBool('userExists', true);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('UID........${widget.userId}');
    // ModelUser user = Provider.of<ModelUser>(context);
    // ModelLoanStatus loanStatus = Provider.of<ModelLoanStatus>(context);
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
              largeTitle: const Text('My Account'),
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
                // FutureBuilder(
                //     // future: ApiServices().load_loan_status(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         // ModelLoanStatus status = snapshot.data!;
                //         // int loan_state = status.loanStatus ?? 1;
                //
                //         if (loan_state == 2) {
                //           return Container(
                //             child: Center(
                //               child: Card(
                //                 color: MyColors().primaryColor,
                //                 child: Container(
                //                   padding: EdgeInsets.all(16),
                //                   child: Row(
                //                     children: [
                //                       Expanded(
                //                         child: Text(
                //                           'You have applied for a loan of ksh ${UniversalMethods.amount_commas(status.loanAmount)}. Please wait your loan is pending verifcation',
                //                           style: TextStyle(color: Colors.white),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           );
                //         } else if (loan_state == 3) {
                //           return Card(
                //             color: MyColors().primaryColor,
                //             child: Container(
                //               padding: EdgeInsets.all(16),
                //               child: Row(
                //                 children: [
                //                   Expanded(
                //                     child: Text(
                //                       'You have a pending loan of ksh ${status.loanAmount}',
                //                       style: TextStyle(color: Colors.white),
                //                     ),
                //                   ),
                //                   GestureDetector(
                //                     child: Container(
                //                       height: 25,
                //                       width: 80,
                //                       child: Material(
                //                         borderRadius:
                //                             BorderRadius.circular(20.0),
                //                         shadowColor: Colors.black,
                //                         color: Colors.white,
                //                         child: Center(
                //                           child: Text(
                //                             'Pay now',
                //                             style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 10,
                //                                 color: MyColors().primaryColor),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     onTap: () {},
                //                   )
                //                 ],
                //               ),
                //             ),
                //           );
                //         } else {
                //           return Container();
                //         }
                //       }
                //       return Container();
                //     }),
                // Container(
                //   height: 120,
                //   child: BannerText(
                //       BannerModel(
                //           id: 1,
                //           title: "",
                //           shortContent:
                //               "Borrow up to Ksh 500,000 and pay it back over up to 12 months",
                //           longContent: "",
                //           isAppFunction: false,
                //           buttonText: "Apply now",
                //           images: ['assets/images/My Post (13).png'],
                //           function: '',
                //           color: Colors.indigo.shade100), () {
                //     // Navigator.push(
                //     //   coext,
                //     //   MaterialPageRoute<void>(
                //     //     builder: (BuildContext context) => Loan(),
                //     //   ),
                //     // );
                //   }),
                // ),
                const SizedBox(
                  height: 24,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 16, right: 8, left: 8),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScreenEditProfile(
                                    fName: widget.fName,
                                    lName: widget.lName,
                                    email: widget.email,
                                    userId: widget.userId,
                                    mobile: widget.phone,
                                  ),
                                ),
                              );
                            },
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.edit_outlined,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    child: Text(
                                  'Edit Profile',
                                  style: TextStyle(fontSize: 13),
                                )),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) => RefferAFriend(),
                              //   ),
                              // );
                            },
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.person_add_alt_outlined,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    child: Text('Refer a Friend',
                                        style: TextStyle(fontSize: 13))),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HelpCenter(),
                                ),
                              );
                            },
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.question_mark_outlined,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    child: Text('Help center',
                                        style: TextStyle(fontSize: 13))),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Terms(1),
                                ),
                              );
                            },
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.info_outline,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text('Terms and Conditons',
                                        style: TextStyle(fontSize: 13))),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: InkWell(
                            onTap: () {
                              Get.to(()=>ChangePassword(fName: widget.fName, email: widget.email, lName: widget.lName, userId: widget.userId));
                            },
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text('Change Password',
                                        style: TextStyle(fontSize: 13))),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: InkWell(
                            onTap: () {
                              _log_out(context);
                            },
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Text('Logout',
                                        style: TextStyle(fontSize: 13))),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                        color: Colors.pink,
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
                            '${widget.phone}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            '${widget.email}',
                            style: TextStyle(
                              fontSize: 12,
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

  Future<void> _log_out(contextr) async {
    setUserExists();
    Get.offAll(() => const LoginPass());
    // await FirebaseAuth.instance.signOut();
    UniversalMethods.show_toast('Signed out', contextr);

    // RestartWidget.restartApp(context);
  }

// Widget top_menu() {
//   return Column(children: [
//     Container(
//         height: 130,
//         child: PageView(
//           controller: _controller,
//           onPageChanged: (int index) {
//             setState(() {
//               currentPage = double.parse(index.toString());
//             });
//           },
//           children: [
//             BannerImage(
//                 BannerModel(
//                     id: 1,
//                     title: "",
//                     shortContent:
//                     "Borrow up to Ksh 500,000 and pay it back over up to 12 months",
//                     longContent: "",
//                     isAppFunction: false,
//                     buttonText: "Apply now",
//                     images: ['assets/images/My Post (13).png'],
//                     function: '',
//                     color: Colors.indigo.shade100), () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => ScreenLoan(),
//                 ),
//               );
//             }),
//             BannerImage(
//                 BannerModel(
//                     id: 1,
//                     title: "",
//                     shortContent:
//                     "Get 500ksh in SHEiQ when you participate in the SHEiQ survey",
//                     longContent: "",
//                     isAppFunction: false,
//                     buttonText: "Participate",
//                     images: ['assets/images/My Post (11).png'],
//                     function: '',
//                     color: Colors.blue.shade100), () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => ScreenSheIq(),
//                 ),
//               );
//             }),
//             BannerImage(
//                 BannerModel(
//                     id: 1,
//                     title: "",
//                     shortContent: "Have any queries about SHEBnks",
//                     longContent: "",
//                     isAppFunction: false,
//                     buttonText: "Ask Us",
//                     images: ['assets/images/help_us_improve.jpg'],
//                     function: '',
//                     color: Colors.pink.shade100), () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => HelpCenter(),
//                 ),
//               );
//             }),
//           ],
//         )),
//     new DotsIndicator(
//       dotsCount: 3,
//       position: currentPage,
//       decorator: DotsDecorator(
//           size: const Size.square(6.0),
//           activeSize: const Size.square(7.0),
//           // activeShape: CircleBorder(
//           //     borderRadius: BorderRadius.circular(5.0)),
//           activeColor: Colors.pink),
//       onTap: (double item) {
//         setState(() {
//           currentPage = item;
//         });
//       },
//     ),
//   ]);
// }
}
