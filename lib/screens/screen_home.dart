import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/api_services/api_services.dart';
import 'package:she_banks/models/banner.dart';
import 'package:she_banks/models/model_user.dart';
import 'package:she_banks/screens/BannerWidget.dart';
import 'package:she_banks/screens/DrawerItems.dart';
import 'package:she_banks/screens/home_notifier.dart';
import 'package:she_banks/screens/screen_help_center.dart';
import 'package:she_banks/screens/screen_loan.dart';
import 'package:she_banks/screens/screen_my_account.dart';
import 'package:she_banks/screens/screen_news.dart';
import 'package:she_banks/screens/screen_send_email.dart';
import 'package:she_banks/screens/screen_she_funds.dart';
import 'package:she_banks/screens/screen_she_learns.dart';
import 'package:she_banks/screens/screen_sheiq.dart';
import 'package:she_banks/screens/screen_terms.dart';
import 'package:she_banks/screens/screen_webview.dart';
import 'package:she_banks/utils/universal_methods.dart';

class Homescreen extends StatefulWidget {
  final fName;
  final lName;
  final phone;
  final token;
  final userId;
  final email;

  const Homescreen(
      {super.key,
       this.fName,
       this.lName,
       this.phone,
       this.token,
       this.email,
       this.userId});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _amountController = TextEditingController();
  final ApiServices _apiServices = ApiServices();

  late bool hasExistingLoan;

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? _mPhone;
  String? _timeOfDay;
  var _userId;
  String? loanId;
  var initAmount;
  double? amountToPay;
  double? remainingAmount;
  String? status;
  var interest;
  String _itext = '';

  // String? _lName;
  // String? _email;
  // String? _userId;
  getLoanDetails() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    setState(() {
      loanId = _prefs.getString('loanId');
      initAmount = _prefs.getDouble('initAmount');
      remainingAmount = _prefs.getDouble('remainingAmount');
      status = _prefs.getString('status');
      amountToPay = _prefs.getDouble('amountToPay');
      interest = (amountToPay!) - (initAmount);

    });
  }

  checkLoan() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      hasExistingLoan = _prefs.getBool('hasExistingLoan')!;
      debugPrint('HasExistingLoan>>>>>>$hasExistingLoan');
    });
  }

  PageController _controller = PageController(
    initialPage: 0,
  );
  double currentPage = 0;

  getTime() {
    var time = DateTime.now();
    var hour = time.hour;
    debugPrint('CurrentHour...$hour');

    if (hour <= 11) {
      _timeOfDay = ' Good Morning';
    } else if (hour <= 17) {
      _timeOfDay = ' Good Afternoon';
    } else {
      _timeOfDay = ' Good Evening';
    }
  }

  getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var phone = prefs.getString("PhoneNumber");
    _mPhone = phone?.replaceAll('+', '');
    debugPrint("phone Number.......$_mPhone");
    return _mPhone;
  }

  getUserData() async {
    _userId = widget.userId;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var user = {
      // _fName = _prefs.getString('fName'),
      // _lName = _prefs.getString("lName"),
      // _email = _prefs.getString('email')
    };
    debugPrint('userDetails........ ${user.toString()}');
    return user;
  }

  @override
  void initState() {
    getLoanDetails();
    checkLoan();
    getTime();
    getUserData();
    getPhone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ModelUser user = Provider.of<ModelUser>(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: _openDrawer,
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        // title: const Text("Haki Plus"),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                Get.to(()=>NotificationPage());
              },
              child: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(right: 8, left: 8),
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 16,
                ),
                first_tile(),
                const SizedBox(
                  height: 32,
                ),
                // if(hasExistingLoan==true)
                hasExistingLoan ? hasLoan() : top_menu(),
                const SizedBox(
                  height: 4,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Expanded(child: item_card(Colors.purple.shade300,Colors.white,Colors.white)),

                        Expanded(
                            child: item_card(
                                Colors.blue.shade300,
                                Colors.white,
                                Colors.white,
                                Icons.attach_money_outlined,
                                'SHEloans',
                                1)),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: item_card(
                            Color(0xffed39ca),
                            Colors.white,
                            Colors.white,
                            Icons.account_balance_outlined,
                            'SheFunds',
                            2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: item_card(
                            // Color(0xffed39ca),
                            Colors.indigo.shade300,
                            Colors.white,
                            Colors.white,
                            Icons.lightbulb_outline,
                            'SheIQ',
                            3,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: item_card(
                            Colors.indigo.shade300,
                            Colors.white,
                            Colors.white,
                            Icons.menu_book_outlined,
                            'SHELearns',
                            4,
                          ),
                        ),

                        // Expanded(child: item_card(Colors.pink.shade300,Colors.white,Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //   Expanded(child: item_card(Colors.blue.shade300,Colors.white,Colors.white)),
                        Expanded(
                          child: item_card(
                            Color(0xffed39ca),
                            Colors.white,
                            Colors.white,
                            Icons.newspaper_outlined,
                            'News',
                            5,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: item_card(
                            Colors.blue.shade300,
                            Colors.white,
                            Colors.white,
                            Icons.person_outline,
                            'My Account',
                            6,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget hasLoan() {
    // padding: EdgeInsets.all(15),
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(
            color: Colors.indigo.shade300,
            borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Initial Loan : ',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white),
                      )),
                  Text('$initAmount ',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Interest : ',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white),
                      )),
                  Text('$initAmount ',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Remaining Amount : ',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white),
                      )),
                  Text('${remainingAmount}',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Loan Status: ',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white),
                      )),
                  Text('$status ',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.white),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (status == "APPROVED" || status =="DISBURSED") ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffed39ca)),
                      onPressed: () {
                        _amountController.clear();
                        showMpesaDialog();
                      },
                      child: Text('Repay Now',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Colors.white),
                          )
                      ),
                    ),
                  ] else
                    ...[]

                  // ElevatedButton(
                  //   style:
                  //       ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  //   onPressed: () {},
                  //   child: Text('Confirm Payment',
                  //       style: GoogleFonts.poppins(
                  //         textStyle: const TextStyle(color: Colors.black),
                  //       )),
                  // ),
                ],
              )
            ],
          ),
        ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Enter Amount To Repay',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(color: Colors.black),
                )),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              child: Column(
                children: [
                  Text('MPESA  Menuy',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Colors.black),
                      )),

                  TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(
                        label: Text('Amount',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.black),
                            ))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Color(0xffed39ca)),
                    onPressed: () {
                      print('Done');
                      var amount = _amountController.text;
                      Map<String, String> data = {
                        "mobile": "$_mPhone",
                        "amount": "$amount"
                      };
                      _apiServices.repayLoan(loanId!, widget.token, data);
                    },
                    child: Text('Pay Now',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ));
      },
    );
  }

  Widget top_menu() {
    return Column(children: [
      Container(
          height: 130,
          child: PageView(
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                currentPage = double.parse(index.toString());
              });
            },
            children: [
              BannerImage(
                  BannerModel(
                      id: 1,
                      title: "",
                      shortContent:
                          "Borrow up to Ksh 500,000 and pay it back over up to 12 months",
                      longContent: "",
                      isAppFunction: false,
                      buttonText: "Apply now",
                      images: ['assets/images/My Post (13).png'],
                      function: '',
                      color: Colors.indigo.shade100), () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LoansPage(
                      token: widget.token,
                      fName: widget.fName,
                      userId: widget.userId,
                    ),
                  ),
                );
              }),
              BannerImage(
                  BannerModel(
                      id: 1,
                      title: "",
                      shortContent:
                          "Get 500ksh in SHEiQ when you participate in the SHEiQ survey",
                      longContent: "",
                      isAppFunction: false,
                      buttonText: "Participate",
                      images: ['assets/images/My Post (11).png'],
                      function: '',
                      color: Colors.blue.shade100), () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) => null,
                //   ),
                // );
              }),
              BannerImage(
                  BannerModel(
                      id: 1,
                      title: "",
                      shortContent: "Have any queries about SHEBnks",
                      longContent: "",
                      isAppFunction: false,
                      buttonText: "Ask Us",
                      images: ['assets/images/help_us_improve.jpg'],
                      function: '',
                      color: Color(0xffed39ca)), () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HelpCenter(),
                  ),
                );
              }),
            ],
          )),
      DotsIndicator(
        dotsCount: 3,
        position: currentPage,
        decorator: const DotsDecorator(
            size: Size.square(6.0),
            activeSize: Size.square(7.0),
            // activeShape: CircleBorder(
            //     borderRadius: BorderRadius.circular(5.0)),
            activeColor: Color(0xffed39ca)),
        onTap: (double item) {
          setState(() {
            currentPage = item;
          });
        },
      ),
    ]);
  }

  Widget item_card(Color color, Color icon_color, Color border, IconData icon,
      String text, int index) {
    return InkWell(
      child: SizedBox(
        height: 120,
        child: Card(
          color: color,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: border),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.white),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: border),
                      ),
                      child: Icon(
                        icon,
                        color: icon_color,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${text}',
                      style: TextStyle(color: icon_color, fontSize: 12),
                    )
                  ],
                )),
          ),
        ),
      ),
      onTap: () {
        if (index == 1) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => LoansPage(
                token: widget.token,
                fName: widget.fName,
                userId: widget.userId,
              ),
            ),
          );
        } else if (index == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ScreenSheFunds(),
            ),
          );
        } else if (index == 3) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ScreenSheIq(),
            ),
          );
        } else if (index == 4) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ScreenSheLearns(),
            ),
          );
        } else if (index == 5) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ScreenNews(),
            ),
          );
        } else if (index == 6) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ScreenMyAccount(
                  fName: widget.fName,
                  lName: widget.lName,
                  phone: widget.phone,
                  token: widget.token,
                  email: widget.email,
                  userId: widget.userId),
            ),
          );
        }
      },
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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ScreenMyAccount(
                        fName: widget.fName,
                        lName: widget.lName,
                        phone: widget.phone,
                        token: widget.token,
                        email: widget.email,
                        userId: widget.userId,
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/default_avatar.png',
                        height: 50,
                        width: 50,
                        color: Color(0xffed39ca),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hello,$_timeOfDay',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 22),
                              )),
                          Text('${widget.fName} ${widget.lName}',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(color: Colors.black),
                              )),
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

  Widget _drawer() {
    var drawerItems = DrawerItems.drawerItems;

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              color: Colors.pink.shade300,
            ),
            height: 264,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 8, right: 8),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openEndDrawer();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Account_profile(token),
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.grey, // red as border color
                          width: .2),
                    ),
                    child: Image.asset(
                      'assets/images/default_avatar.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),
                Text(
                  '${widget.fName} ' + ' ${widget.lName}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 2,
                ),
                // Text(
                //   "0728492268",
                //   style: TextStyle(fontSize: 13, color: Colors.white),
                // ),
                Text(
                  '${widget.phone}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Scrollbar(
              child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: drawerItems.length,
                itemBuilder: (BuildContext context, int index) {
                  Map item = drawerItems[index];
                  return _item(
                    item,
                    index,
                    _mPhone,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  Widget _item(Map item, int index, String? phone) {
    var user = 'auth.currentUser?.uid';

    // if(index==3 && phone==null ){
    //   return Container();
    // }
    return ListTile(
      leading: Icon(
        item['icon'],
        size: 24,
        color: Color(0xffed39ca),
      ),
      subtitle: _text(index, item, user, phone),
      title: _title(index, item, user),
      onTap: () {
        _closeDrawer();

        if (index == 0) {
          // _scaffoldKey.currentState?.openEndDrawer();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenMyAccount(
                fName: widget.fName,
                lName: widget.lName,
                phone: widget.phone,
                token: widget.token,
                email: widget.email,
                userId: widget.userId,
              ),
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HelpCenter(),
            ),
          );

          // Navigator.pop(context);
        } else if (index == 2) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => Terms(1),
            ),
          );
        } else if (index == 3) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  ScreenWebView('About SHEbnks', 'https://shebnks.mobi/'),
            ),
          );
        } else if (index == 4) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const EmailSender(),
            ),
          );
        }
      },
    );
  }

  Widget _title(index, item, user) {
    return Text(
      '${item['name']}',
      style: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  Widget _text(index, item, user, phone) {
    return Text(
      '${item['description']}',
      style: const TextStyle(fontSize: 11, color: Colors.grey),
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }


  void showMpesaDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xfff6f6f6),
        title: const Text('Pay Via MPESA'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Image.asset('assets/images/saf.png', height: 100),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _amountController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Amount';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter Amount',
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Pay Now', style: TextStyle(color: Colors.green),),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String enteredText = _amountController.text;
                print('Entered Text: $enteredText');
                var amount = _amountController.text;
                Map<String, String> data = {
                  "mobile": "$_mPhone",
                  "amount": "$amount"
                };
                _apiServices.repayLoan(loanId!, widget.token, data).then((value) {
                  if(value.status=='OK'){
                    _showDialog(value.message.toString());
                  }
                  else{
                    _showFailDialog(value.message.toString());
                  }
                });
                Navigator.of(context).pop();
                UniversalMethods.show_toast('Processing request....Kindly Wait', context);
              }
            },
          ),
        ],
      );



});
  }
  void _showDialog(String message){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Container(
            height: MediaQuery.of(context).size.height*0.23,

            child: Column(
                children: [
                  SizedBox(height: 15,),

                  Icon(Icons.check_circle, size: 50, color: Colors.green.shade300,),
                  SizedBox(height: 15,),
                  Text(message),
                  SizedBox(height: 15,),
                  OutlinedButton(onPressed: () {
                    Navigator.of(context).pop();
                  },
                      child: Text('Ok'))

                ]

            )),
      );

    });
  }void _showFailDialog(String message){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: Container(
            height: MediaQuery.of(context).size.height*0.23,

            child: Column(
                children: [
                  SizedBox(height: 15,),

                  Icon(Icons.warning_amber_rounded, size: 50, color: Colors.red.shade300,),
                  SizedBox(height: 15,),
                  Text(message),
                  SizedBox(height: 15,),
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
