import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/screens/screen_home.dart';
//
// import 'dashboard.dart';
// import 'navigation_home_screen.dart';

class Terms extends StatefulWidget {
  int source=0;
  Terms(int source){
    this.source==source;
  }
  @override
  _Terms createState() => _Terms();
}

class _Terms extends State<Terms>{


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Terms and conditions",style: TextStyle(color: Colors.black),),
          centerTitle: true,

        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor:Colors.white,
          foregroundColor: Colors.black,
          onPressed: ()  {

            if(widget.source==1){
              Navigator.pop(context);
            }else {
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => Homescreen(),
              //   ),
              // );
            }

            // final prefs = await SharedPreferences.getInstance();
            // prefs.setBool("terms", true);
            // Navigator.pushReplacementNamed(context, '/dashboard');

          },
          icon: Icon(Icons.arrow_forward_ios_rounded),
          label: Text("Accept"),
        ),

        body:SingleChildScrollView(

            child: SafeArea(
                top: true,
                minimum: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                  Text("SHEBnks APPLICATION TERMS OF SERVICE",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  Text("Last Updated: 28 July 2021",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    SizedBox(height: 20,),
                    RichText(
                      overflow: TextOverflow.clip,
                      text: TextSpan(
                        children: const <TextSpan>[
                          TextSpan(text:"These terms of service (\"Terms\") apply to your access and use of **[APP NAME/WEBSITE/OTHER SERVICES]** (the \"Service\"). Please read them carefully.\n  " "\n", style: TextStyle(fontFamily: 'Montserrat',color: Colors.black,),),
                          TextSpan(text: "Accepting these Terms\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "If you access or use the Service, it means you agree to be bound by all of the terms below. So, before you use the Service, please read all of the terms. If you don't agree to all of the terms below, please do not use the Service. Also, if a term does not make sense to you, please let us know by e-mailing **[SUPPORT EMAIL ADDRESS]**.\n " "\n",style: TextStyle(fontFamily: 'Montserrat',color: Colors.black) ),
                          TextSpan(text: "We reserve the right to modify these Terms at any time. For instance, we may need to change these Terms if we come out with a new feature or for some other reason.\n " , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Whenever we make changes to these Terms, the changes are effective **[TIME PERIOD]** after we post such revised Terms (indicated by revising the date at the top of these Terms) or upon your acceptance if we provide a mechanism for your immediate acceptance of the revised Terms (such as a click-through confirmation or acceptance button). It is your responsibility to check **[APP NAME]** for changes to these Terms.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "If you continue to use the Service after the revised Terms go into effect, then you have accepted the changes to these Terms.\n" "\n", style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Privacy Policy\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "For information about how we collect and use information about users of the Service, please check out our privacy policy available at **[INSERT LINK]**.\n" "\n", style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Third-Party Services\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "From time to time, we may provide you with links to third party websites or services that we do not own or control. Your use of the Service may also include the use of applications that are developed or owned by a third party. Your use of such third party applications, websites, and services is governed by that party's own terms of service or privacy policies. We encourage you to read the terms and conditions and privacy policy of any third party application, website or service that you visit or use.\n" "\n", style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Creating Accounts\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "When you create an account or use another service to log in to the Service, you agree to maintain the security of your password and accept all risks of unauthorized access to any data or other information you provide to the Service.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "If you discover or suspect any Service security breaches, please let us know as soon as possible.\n""\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Your Content & Conduct\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "**[CUSTOMIZE THE FOLLOWING SECTION BASED ON THE TYPE OF CONTENT SUBMITTED BY USERS.]**\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Our Service allows you and other users to post, link and otherwise make available content. You are responsible for the content that you make available to the Service, including its legality, reliability, and appropriateness.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "When you post, link or otherwise make available content to the Service, you grant us the right and license to use, reproduce, modify, publicly perform, publicly display and distribute your content on or through the Service. We may format your content for display throughout the Service, but we will not edit or revise the substance of your content itself.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Aside from our limited right to your content, you retain all of your rights to the content you post, link and otherwise make available on or through the Service.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "**[CUSTOMIZE THE FOLLOWING SECTION BASED ON YOUR DATA RETENTION PRACTICES.]**\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "You can remove the content that you posted by deleting it. Once you delete your content, it will not appear on the Service, but copies of your deleted content may remain in our system or backups for some period of time. We will retain web server access logs for a maximum of **[TIME PERIOD]** and then delete them.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "You may not post, link and otherwise make available on or through the Service any of the following:\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "**[INCLUDE ANY OTHER CONTENT RESTRICTIONS THAT MAY BE UNIQUE TO YOUR COMPANY.]**\n" "\n", style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "* Content that is libelous, defamatory, bigoted, fraudulent or deceptive;\n"
                            "*Content that is illegal or unlawful, that would otherwise create liability;\n"
                            "* Content that may infringe or violate any patent, trademark, trade secret, copyright, right of privacy, right of publicity or other intellectual or other right of any party;\n"
                            "* Mass or repeated promotions, political campaigning or commercial messages directed at users who do not follow you (SPAM);\n"
                            "* Private information of any third party (e.g., addresses, phone numbers, email addresses, Social Security numbers and credit card numbers); and\n"
                            "* Viruses, corrupted data or other harmful, disruptive or destructive files or code.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: " * Use the Service in any manner that could interfere with, disrupt, negatively affect or inhibit other users from fully enjoying the Service or that could damage, disable, overburden or impair the functioning of the Service;\n" +
                              "* Impersonate or post on behalf of any person or entity or otherwise misrepresent your affiliation with a person or entity;\n"
                              "* Collect any personal information about other users, or intimidate, threaten, stalk or otherwise harass other users of the Service;\n"
                              "* Create an account or post any content if you are not over 13 years of age years of age; and\n""\n"
                              "* Circumvent or attempt to circumvent any filtering, security measures, rate limits or other features designed to protect the Service, users of the Service, or third parties.\n""\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "[DEVELOPER NAME] Materials\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "We put a lot of effort into creating the Service including, the logo and all designs, text, graphics, pictures, information and other content (excluding your content). This property is owned by us or our licensors and it is protected by U.S. and international copyright laws. We grant you the right to use it.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "However, unless we expressly state otherwise, your rights do not include: (i) publicly performing or publicly displaying the Service; (ii) modifying or otherwise making any derivative uses of the Service or any portion thereof; (iii) using any data mining, robots or similar data gathering or extraction methods; (iv) downloading (other than page caching) of any portion of the Service or any information contained therein; (v) reverse engineering or accessing the Service in order to build a competitive product or service; or (vi) using the Service other than for its intended purposes. If you do any of this stuff, we may terminate your use of the Service.\n" "\n", style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Hyperlinks and Third Party Content\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "**[DEVELOPER NAME]** makes no claim or representation regarding, and accepts no responsibility for third party websites accessible by hyperlink from the Service or websites linking to the Service. When you leave the Service, you should be aware that these Terms and our policies no longer govern.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "If there is any content on the Service from you and others, we don't review, verify or authenticate it, and it may include inaccuracies or false information. We make no representations, warranties, or guarantees relating to the quality, suitability, truth, accuracy or completeness of any content contained in the Service. You acknowledge sole responsibility for and assume all risk arising from your use of or reliance on any content.\n" "\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Unavoidable Legal Stuff\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "THE SERVICE AND ANY OTHER SERVICE AND CONTENT INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THE SERVICE ARE PROVIDED TO YOU ON AN AS IS OR AS AVAILABLE BASIS WITHOUT ANY REPRESENTATIONS OR WARRANTIES OF ANY KIND. WE DISCLAIM ANY AND ALL WARRANTIES AND REPRESENTATIONS (EXPRESS OR IMPLIED, ORAL OR WRITTEN) WITH RESPECT TO THE SERVICE AND CONTENT INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THE SERVICE WHETHER ALLEGED TO ARISE BY OPERATION OF LAW, BY REASON OF CUSTOM OR USAGE IN THE TRADE, BY COURSE OF DEALING OR OTHERWISE.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "IN NO EVENT WILL **[DEVELOPER NAME]** BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY SPECIAL, INDIRECT, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY KIND ARISING OUT OF OR IN CONNECTION WITH THE SERVICE OR ANY OTHER SERVICE AND/OR CONTENT INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THE SERVICE, REGARDLESS OF THE FORM OF ACTION, WHETHER IN CONTRACT, TORT, STRICT LIABILITY OR OTHERWISE, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES OR ARE AWARE OF THE POSSIBILITY OF SUCH DAMAGES. OUR TOTAL LIABILITY FOR ALL CAUSES OF ACTION AND UNDER ALL THEORIES OF LIABILITY WILL BE LIMITED TO THE AMOUNT YOU PAID TO **[DEVELOPER NAME]**. THIS SECTION WILL BE GIVEN FULL EFFECT EVEN IF ANY REMEDY SPECIFIED IN THIS AGREEMENT IS DEEMED TO HAVE FAILED OF ITS ESSENTIAL PURPOSE.\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "You agree to defend, indemnify and hold us harmless from and against any and all costs, damages, liabilities, and expenses (including attorneys' fees, costs, penalties, interest and disbursements) we incur in relation to, arising from, or for the purpose of avoiding, any claim or demand from a third party relating to your use of the Service or the use of the Service by any person using your account, including any claim that your use of the Service violates any applicable law or regulation, or the rights of any third party, and/or your violation of these Terms.\n" "\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Copyright Complaints\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "**[IF YOUR APPLICATION WILL PERMIT USER GENERATED CONTENT, CONSULT WITH LEGAL COUNSEL REGARDING DMCA COMPLIANCE PROCEDURES AND INCLUDE THIS SECTION AND A COPYRIGHT POLICY.]**\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "We take intellectual property rights seriously. In accordance with the Digital Millennium Copyright Act (\"DMCA\") and other applicable law, we have adopted a policy of terminating, in appropriate circumstances and, at our sole discretion, access to the service for users who are deemed to be repeat infringers. **[LINK TO FULL COPYRIGHT POLICY IF APPLICABLE.]**\n" "\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Governing Law\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "**[PLEASE NOTE THAT THIS TEMPLATE INCORPORATES TERMS AND SECTIONS THAT ARE INTENDED FOR U.S-BASED SERVICES. CONSULT WITH LEGAL COUNSEL TO DETERMINE THE APPROPRIATE GOVERNING LAW FOR YOUR TERMS AND WHETHER YOU ARE SUBJECT TO ANY ADDITIONAL LEGAL REQUIREMENTS BASED ON HOW AND WHERE YOUR SERVICE OPERATES.]**\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "The validity of these Terms and the rights, obligations, and relations of the parties under these Terms will be construed and determined under and in accordance with the laws of the **[U.S. STATE NAME OR OTHER JURISDICTION]**, without regard to conflicts of law principles.\n" "\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Jurisdiction\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "You expressly agree that exclusive jurisdiction for any dispute with the Service or relating to your use of it, resides in the courts of the **[STATE NAME OR JURISDICTION]** and you further agree and expressly consent to the exercise of personal jurisdiction in the courts of the **[STATE NAME OR JURISDICTION]** located in **[CITY AND STATE IF APPLICABLE]** in connection with any such dispute including any claim involving Service. You further agree that you and Service will not commence against the other a class action, class arbitration or other representative action or proceeding.\n" "\n", style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Termination\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "If you breach any of these Terms, we have the right to suspend or disable your access to or use of the Service.\n""\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: " Entire Agreement\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "These Terms constitute the entire agreement between you and **[DEVELOPER NAME]** regarding the use of the Service, superseding any prior agreements between you and **[DEVELOPER NAME]** relating to your use of the Service.\n""\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Feedback\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "Please let us know what you think of the Service, these Terms and, in general, **[APP NAME]**. When you provide us with any feedback, comments or suggestions about the Service, these Terms and, in general, **[APP NAME]**, you irrevocably assign to us all of your right, title and interest in and to your feedback, comments and suggestions.\n""\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "Questions & Contact Information\n" "\n" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          TextSpan(text: "Questions or comments about the Service may be directed to us at the email address **[SUPPORT EMAIL ADDRESS]**.\n""\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                          TextSpan(text: "**[FINAL NOTE: CERTAIN APPLICATION STORES (E.G., APPLE APP STORE, GOOGLE PLAY, ETC.) MAY REQUIRE YOU TO INCLUDE ADDITIONAL TERMS AND CONDITIONS IN THESE TERMS OF SERVICE AS A CONDITION TO MAKING YOUR APPLICATION AVAILABLE ON SUCH PLATFORM. IF APPLICABLE, REVIEW YOUR AGREEMENT WITH ANY SUCH APPLICATION STORE TO DETERMINE IF ADDITIONAL TERMS ARE REQUIRED.]**\n""\n" , style: TextStyle(fontFamily: 'Montserrat',color: Colors.black),),
                        ],

                      ),
                    )
                  // Text(string,style: TextStyle(fontFamily: 'Montserrat'),textAlign: TextAlign.left,)

                ],),),),
    );
  }
  // static const String string=
  //     "These terms of service (\"Terms\") apply to your access and use of **[APP NAME/WEBSITE/OTHER SERVICES]** (the \"Service\"). Please read them carefully.\n" +
  //     "\n" +
  //     "## Accepting these Terms\n" +
  //     "\n" +
  //     "If you access or use the Service, it means you agree to be bound by all of the terms below. So, before you use the Service, please read all of the terms. If you don't agree to all of the terms below, please do not use the Service. Also, if a term does not make sense to you, please let us know by e-mailing **[SUPPORT EMAIL ADDRESS]**.\n" +
  //     "\n" +
  //     "\n" +
  //     "We reserve the right to modify these Terms at any time. For instance, we may need to change these Terms if we come out with a new feature or for some other reason.\n" +
  //     "\n" +
  //     "Whenever we make changes to these Terms, the changes are effective **[TIME PERIOD]** after we post such revised Terms (indicated by revising the date at the top of these Terms) or upon your acceptance if we provide a mechanism for your immediate acceptance of the revised Terms (such as a click-through confirmation or acceptance button). It is your responsibility to check **[APP NAME]** for changes to these Terms.\n" +
  //     "\n" +
  //     "If you continue to use the Service after the revised Terms go into effect, then you have accepted the changes to these Terms.\n" +
  //     "\n" +
  //     "## Privacy Policy\n" +
  //     "\n" +
  //     "For information about how we collect and use information about users of the Service, please check out our privacy policy available at **[INSERT LINK]**.\n" +
  //     "\n" +
  //     "## Third-Party Services\n" +
  //     "\n" +
  //     "From time to time, we may provide you with links to third party websites or services that we do not own or control. Your use of the Service may also include the use of applications that are developed or owned by a third party. Your use of such third party applications, websites, and services is governed by that party's own terms of service or privacy policies. We encourage you to read the terms and conditions and privacy policy of any third party application, website or service that you visit or use.\n" +
  //     "\n" +
  //     "## Creating Accounts\n" +
  //     "\n" +
  //     "When you create an account or use another service to log in to the Service, you agree to maintain the security of your password and accept all risks of unauthorized access to any data or other information you provide to the Service.\n" +
  //     "\n" +
  //     "If you discover or suspect any Service security breaches, please let us know as soon as possible.\n" +
  //     "\n" +
  //     "## Your Content & Conduct\n" +
  //     "\n" +
  //     "**[CUSTOMIZE THE FOLLOWING SECTION BASED ON THE TYPE OF CONTENT SUBMITTED BY USERS.]**\n" +
  //     "\n" +
  //     "Our Service allows you and other users to post, link and otherwise make available content. You are responsible for the content that you make available to the Service, including its legality, reliability, and appropriateness.\n" +
  //     "\n" +
  //     "When you post, link or otherwise make available content to the Service, you grant us the right and license to use, reproduce, modify, publicly perform, publicly display and distribute your content on or through the Service. We may format your content for display throughout the Service, but we will not edit or revise the substance of your content itself.\n" +
  //     "\n" +
  //     "Aside from our limited right to your content, you retain all of your rights to the content you post, link and otherwise make available on or through the Service.\n" +
  //     "\n" +
  //     "**[CUSTOMIZE THE FOLLOWING SECTION BASED ON YOUR DATA RETENTION PRACTICES.]**\n" +
  //     "\n" +
  //     "You can remove the content that you posted by deleting it. Once you delete your content, it will not appear on the Service, but copies of your deleted content may remain in our system or backups for some period of time. We will retain web server access logs for a maximum of **[TIME PERIOD]** and then delete them.\n" +
  //     "\n" +
  //     "You may not post, link and otherwise make available on or through the Service any of the following:\n" +
  //     "\n" +
  //     "**[INCLUDE ANY OTHER CONTENT RESTRICTIONS THAT MAY BE UNIQUE TO YOUR COMPANY.]**\n" +
  //     "\n" +
  //     "* Content that is libelous, defamatory, bigoted, fraudulent or deceptive;\n" +
  //     "* Content that is illegal or unlawful, that would otherwise create liability;\n" +
  //     "* Content that may infringe or violate any patent, trademark, trade secret, copyright, right of privacy, right of publicity or other intellectual or other right of any party;\n" +
  //     "* Mass or repeated promotions, political campaigning or commercial messages directed at users who do not follow you (SPAM);\n" +
  //     "* Private information of any third party (e.g., addresses, phone numbers, email addresses, Social Security numbers and credit card numbers); and\n" +
  //     "* Viruses, corrupted data or other harmful, disruptive or destructive files or code.\n" +
  //     "\n" +
  //     "Also, you agree that you will not do any of the following in connection with the Service or other users:\n" +
  //     "\n" +
  //     "* Use the Service in any manner that could interfere with, disrupt, negatively affect or inhibit other users from fully enjoying the Service or that could damage, disable, overburden or impair the functioning of the Service;\n" +
  //     "* Impersonate or post on behalf of any person or entity or otherwise misrepresent your affiliation with a person or entity;\n" +
  //     "* Collect any personal information about other users, or intimidate, threaten, stalk or otherwise harass other users of the Service;\n" +
  //     "* Create an account or post any content if you are not over 13 years of age years of age; and\n" +
  //     "* Circumvent or attempt to circumvent any filtering, security measures, rate limits or other features designed to protect the Service, users of the Service, or third parties.\n" +
  //     "\n" +
  //     "## **[DEVELOPER NAME]** Materials\n" +
  //     "\n" +
  //     "We put a lot of effort into creating the Service including, the logo and all designs, text, graphics, pictures, information and other content (excluding your content). This property is owned by us or our licensors and it is protected by U.S. and international copyright laws. We grant you the right to use it.\n" +
  //     "\n" +
  //     "However, unless we expressly state otherwise, your rights do not include: (i) publicly performing or publicly displaying the Service; (ii) modifying or otherwise making any derivative uses of the Service or any portion thereof; (iii) using any data mining, robots or similar data gathering or extraction methods; (iv) downloading (other than page caching) of any portion of the Service or any information contained therein; (v) reverse engineering or accessing the Service in order to build a competitive product or service; or (vi) using the Service other than for its intended purposes. If you do any of this stuff, we may terminate your use of the Service.\n" +
  //     "\n" +
  //     "## Hyperlinks and Third Party Content\n" +
  //     "\n" +
  //     "You may create a hyperlink to the Service. But, you may not use, frame or utilize framing techniques to enclose any of our trademarks, logos or other proprietary information without our express written consent.\n" +
  //     "\n" +
  //     "**[DEVELOPER NAME]** makes no claim or representation regarding, and accepts no responsibility for third party websites accessible by hyperlink from the Service or websites linking to the Service. When you leave the Service, you should be aware that these Terms and our policies no longer govern.\n" +
  //     "\n" +
  //     "If there is any content on the Service from you and others, we don't review, verify or authenticate it, and it may include inaccuracies or false information. We make no representations, warranties, or guarantees relating to the quality, suitability, truth, accuracy or completeness of any content contained in the Service. You acknowledge sole responsibility for and assume all risk arising from your use of or reliance on any content.\n" +
  //     "\n" +
  //     "## Unavoidable Legal Stuff\n" +
  //     "\n" +
  //     "THE SERVICE AND ANY OTHER SERVICE AND CONTENT INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THE SERVICE ARE PROVIDED TO YOU ON AN AS IS OR AS AVAILABLE BASIS WITHOUT ANY REPRESENTATIONS OR WARRANTIES OF ANY KIND. WE DISCLAIM ANY AND ALL WARRANTIES AND REPRESENTATIONS (EXPRESS OR IMPLIED, ORAL OR WRITTEN) WITH RESPECT TO THE SERVICE AND CONTENT INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THE SERVICE WHETHER ALLEGED TO ARISE BY OPERATION OF LAW, BY REASON OF CUSTOM OR USAGE IN THE TRADE, BY COURSE OF DEALING OR OTHERWISE.\n" +
  //     "\n" +
  //     "IN NO EVENT WILL **[DEVELOPER NAME]** BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY SPECIAL, INDIRECT, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY KIND ARISING OUT OF OR IN CONNECTION WITH THE SERVICE OR ANY OTHER SERVICE AND/OR CONTENT INCLUDED ON OR OTHERWISE MADE AVAILABLE TO YOU THROUGH THE SERVICE, REGARDLESS OF THE FORM OF ACTION, WHETHER IN CONTRACT, TORT, STRICT LIABILITY OR OTHERWISE, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES OR ARE AWARE OF THE POSSIBILITY OF SUCH DAMAGES. OUR TOTAL LIABILITY FOR ALL CAUSES OF ACTION AND UNDER ALL THEORIES OF LIABILITY WILL BE LIMITED TO THE AMOUNT YOU PAID TO **[DEVELOPER NAME]**. THIS SECTION WILL BE GIVEN FULL EFFECT EVEN IF ANY REMEDY SPECIFIED IN THIS AGREEMENT IS DEEMED TO HAVE FAILED OF ITS ESSENTIAL PURPOSE.\n" +
  //     "\n" +
  //     "You agree to defend, indemnify and hold us harmless from and against any and all costs, damages, liabilities, and expenses (including attorneys' fees, costs, penalties, interest and disbursements) we incur in relation to, arising from, or for the purpose of avoiding, any claim or demand from a third party relating to your use of the Service or the use of the Service by any person using your account, including any claim that your use of the Service violates any applicable law or regulation, or the rights of any third party, and/or your violation of these Terms.\n" +
  //     "\n" +
  //     "## Copyright Complaints\n" +
  //     "\n" +
  //     "**[IF YOUR APPLICATION WILL PERMIT USER GENERATED CONTENT, CONSULT WITH LEGAL COUNSEL REGARDING DMCA COMPLIANCE PROCEDURES AND INCLUDE THIS SECTION AND A COPYRIGHT POLICY.]**\n" +
  //     "\n" +
  //     "We take intellectual property rights seriously. In accordance with the Digital Millennium Copyright Act (\"DMCA\") and other applicable law, we have adopted a policy of terminating, in appropriate circumstances and, at our sole discretion, access to the service for users who are deemed to be repeat infringers. **[LINK TO FULL COPYRIGHT POLICY IF APPLICABLE.]**\n" +
  //     "\n" +
  //     "## Governing Law\n" +
  //     "\n" +
  //     "**[PLEASE NOTE THAT THIS TEMPLATE INCORPORATES TERMS AND SECTIONS THAT ARE INTENDED FOR U.S-BASED SERVICES. CONSULT WITH LEGAL COUNSEL TO DETERMINE THE APPROPRIATE GOVERNING LAW FOR YOUR TERMS AND WHETHER YOU ARE SUBJECT TO ANY ADDITIONAL LEGAL REQUIREMENTS BASED ON HOW AND WHERE YOUR SERVICE OPERATES.]**\n" +
  //     "\n" +
  //     "The validity of these Terms and the rights, obligations, and relations of the parties under these Terms will be construed and determined under and in accordance with the laws of the **[U.S. STATE NAME OR OTHER JURISDICTION]**, without regard to conflicts of law principles.\n" +
  //     "\n" +
  //     "## Jurisdiction\n" +
  //     "\n" +
  //     "You expressly agree that exclusive jurisdiction for any dispute with the Service or relating to your use of it, resides in the courts of the **[STATE NAME OR JURISDICTION]** and you further agree and expressly consent to the exercise of personal jurisdiction in the courts of the **[STATE NAME OR JURISDICTION]** located in **[CITY AND STATE IF APPLICABLE]** in connection with any such dispute including any claim involving Service. You further agree that you and Service will not commence against the other a class action, class arbitration or other representative action or proceeding.\n" +
  //     "\n" +
  //     "## Termination\n" +
  //     "\n" +
  //     "If you breach any of these Terms, we have the right to suspend or disable your access to or use of the Service.\n" +
  //     "\n" +
  //     "## Entire Agreement\n" +
  //     "\n" +
  //     "These Terms constitute the entire agreement between you and **[DEVELOPER NAME]** regarding the use of the Service, superseding any prior agreements between you and **[DEVELOPER NAME]** relating to your use of the Service.\n" +
  //     "\n" +
  //     "## Feedback\n" +
  //     "\n" +
  //     "Please let us know what you think of the Service, these Terms and, in general, **[APP NAME]**. When you provide us with any feedback, comments or suggestions about the Service, these Terms and, in general, **[APP NAME]**, you irrevocably assign to us all of your right, title and interest in and to your feedback, comments and suggestions.\n" +
  //     "\n" +
  //     "## Questions & Contact Information\n" +
  //     "\n" +
  //     "Questions or comments about the Service may be directed to us at the email address **[SUPPORT EMAIL ADDRESS]**.\n" +
  //     "\n" +
  //     "**[FINAL NOTE: CERTAIN APPLICATION STORES (E.G., APPLE APP STORE, GOOGLE PLAY, ETC.) MAY REQUIRE YOU TO INCLUDE ADDITIONAL TERMS AND CONDITIONS IN THESE TERMS OF SERVICE AS A CONDITION TO MAKING YOUR APPLICATION AVAILABLE ON SUCH PLATFORM. IF APPLICABLE, REVIEW YOUR AGREEMENT WITH ANY SUCH APPLICATION STORE TO DETERMINE IF ADDITIONAL TERMS ARE REQUIRED.]**";

}
