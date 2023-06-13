import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:seedfund/constants/Theme.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:expandable/expandable.dart';
import 'package:she_banks/screens/colors.dart';
import 'package:she_banks/screens/screen_send_email.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dashboard.dart';
// import 'navigation_home_screen.dart';

class HelpCenter extends StatefulWidget {
  @override
  _HelpCenter createState() => _HelpCenter();
}

class _HelpCenter extends State<HelpCenter>{

  String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.pink,foregroundColor: Colors.white,onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => EmailSender(),
          ),
        );
      },
      child: Icon(Icons.email_outlined),),

        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Help Center",style: TextStyle(color: Colors.black),),

        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   backgroundColor:MyColors().primaryColor,
        //   foregroundColor: Colors.white,
        //   onPressed: () async {
        //     final Uri emailLaunchUri = Uri(
        //       scheme: 'mailto',
        //       path: 'developers@dotconnectafrica.org',
        //       query: encodeQueryParameters(<String, String>{
        //         'subject': 'shebnks query'
        //       }),
        //     );
        //     launch(emailLaunchUri.toString());
        //   },
        //   icon: Icon(Icons.question_answer),
        //   label: Text("Ask us"),
        // ),

        body:SingleChildScrollView(

            child: SafeArea(
                top: true,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Card1(title: "Profile settings",color: Colors.white,  content: profileSettings,image: 'assets/images/—Pngtree—instagram people profile sets user_5253843.png',
                        moreinfo: RichText(
                            overflow: TextOverflow.clip,
                            text: TextSpan(
                                children: const <TextSpan>[
                                  TextSpan(text: "How do i edit my profile?\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                  TextSpan(text: "The profile data you set up during registration is retained until you change it to do so.\n 1.Click onto the profile tab  when logged into your shebnks account \n 2.click the first option \"profile details\" \n3.click on edit profile and write down your preferred data \n " "\n",style: TextStyle(fontFamily: 'Montserrat',color: Colors.black) ),
                                  TextSpan(text: "How do i change my password?\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                  TextSpan(text: "Your accounts password can be changed so long as you are logged into your account to do so.\n 1.Click onto the profile tab  when logged into your shebnks account \n 2.click the second option \"App and security\" \n3.click on edit password and write down your preferred password \n " "\n",style: TextStyle(fontFamily: 'Montserrat',color: Colors.black) ),
                                  TextSpan(text: "How do i manage my notifications?\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                  TextSpan(text: "You can get notified of important notifications through your email and phone number to do so.\n 1.Click onto the profile tab  when logged into your shebnks account \n 2.click the third option \"Notifications\" \n3.click on your preferred notification medium \n " "\n",style: TextStyle(fontFamily: 'Montserrat',color: Colors.black) ),

                                ]
                            )
                        ),),

                    Card1(title: "SHEBnks secure login",color: Colors.white,content: fingerPrintAuth,image: 'assets/images/—Pngtree—fingerprint recognition technology concept a_5334450.png',
                        moreinfo:RichText(
                            overflow: TextOverflow.clip,
                            text: TextSpan(
                                children: const <TextSpan>[
                                  TextSpan(text: "How do i enroll my fingerprints?\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                  TextSpan(text: "Shebnks secure login provide a secure and a less stressful authentication to do so.\n 1.Click onto the profile tab  when logged into your shebnks account \n 2.click the second option \"App and security\" \n3.Enable shebnks secure login and put in your fingerprint \n " "\n",style: TextStyle(fontFamily: 'Montserrat',color: Colors.black) ),
                                  TextSpan(text: "Can i use my shebnks secure login data on different devices?\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                  TextSpan(text: "Unfortunately shebnks secure login only works on one device and one account,any other way will not work,to register a new account on the phone you have to delete shebnks secure login on the other account \n " "\n",style: TextStyle(fontFamily: 'Montserrat',color: Colors.black) ),

                                ]
                            )
                        ) ),

              Card1(title: "How does SHEFunds works",color: Colors.white,content: sheFunds,image: 'assets/images/rising_trend_of_money_funds.png',
              moreinfo: RichText(
                  overflow: TextOverflow.clip,
                  text: TextSpan(
                      children: const <TextSpan>[
                        TextSpan(text: "Terms and conditions of SHEFunds?\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                        TextSpan(text: "1.Please cite sources if you have used someone else’s work. Plagiarizing will result in automatic disqualification.\n"+
                          "2.Keep your proposal Short:. A maximum of 4 pages Text only or 6 Pages if it includes images.\n"+
                          "3.Keep it simple :An easy to understand proposal makes for a happy judge.\n"+
                          "4.Be practical:Give solutions that are out of the box that can be implemented fast and are scalable.\n"+
                          "5.One submission per person\n"+
                          "6.Judges Award is Final\n"+
                          "Enjoy the process \n " "\n",style: TextStyle(fontFamily: 'Montserrat',color: Colors.black) ),
                        ]
                  )
              ),
              ),
                    Card1(title: "How does SHELoans work",color: Colors.white,content: sheLoans,image: 'assets/images/vector_loan_icon.png',

                    moreinfo: RichText(
                        overflow: TextOverflow.clip,
                        text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(text: "How do i qualify for a loan?\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              TextSpan(text: "To qualify for a loan all you need is to authenticate you mobile number you are going to use to do so.\n 1.Click onto the profile tab  when logged into your shebnks account \n 2.click the first option \"profile details\" \n3.Click on verify phone number and follow the instructions given \n " "\n",style: TextStyle(fontFamily: 'Montserrat',color: Colors.black) ),

                            ]
                        )
                    ) ,),
                    Card1(title: "How does SHEiQ work",color: Colors.white,content: sheIq,image: 'assets/images/brain.png',
                    ),
                    Card1(title: "How does SHEFinance work",color: Colors.white,content: sheFinance,image: 'assets/images/—Pngtree—cartoon business women_4825469.png',)

                    ,SizedBox(height: 70,),
                  ],)))
    );
  }

}
const profileSettings =
    "View and update you profile";

const fingerPrintAuth =
    "Secure your account with your fingerprints";
const sheFunds =
    "SHEFunds gives secure financial grants for women";
const sheIq =
    "SHEiQ has a series of questions that show your eligibility to be granted a loan by sheBanks ";
const sheFinance =
    "SHEFinance gives you financial information to help you make informed decisions about your finances ";
const sheLoans =
    "SHELoans gives unsecured interest based loans to women";
class Card1 extends StatelessWidget {
  final String? title,image,content;
  final Widget? moreinfo;
  final Color? color;
  Card1({
    Key? key, this.title,this.color,this.image,this.content,this.moreinfo
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,

                  child: Container(

                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.rectangle,

                    ),
                    child: Image.asset(image!),
                  ),
                ),
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          title!,
                          // style: Theme.of(context).textTheme.body2,
                        )),
                    collapsed: Text(
                      content!,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(1))
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: moreinfo),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
