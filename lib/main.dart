import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:provider/provider.dart';
import 'package:she_banks/api_services/api_services.dart';
import 'package:she_banks/models/loanModelCheck.dart';
import 'package:she_banks/models/loan_types.dart';
import 'package:she_banks/models/model_loan_status.dart';
import 'package:she_banks/models/model_user.dart';
import 'package:she_banks/screens/restart_widget.dart';
import 'package:she_banks/screens/screen_sheiq.dart';
import 'package:she_banks/screens/splash_screen.dart';
import 'package:she_banks/test.dart';
import 'package:she_banks/utils/db_helper.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
final dbHelper = DatabaseHelper();

void main() async {
  MpesaFlutterPlugin.setConsumerKey("DP5PtSwqPSnfMK0mYK6XHjXEZ0Owallx");
  MpesaFlutterPlugin.setConsumerSecret("zOYjYZFvYXc10AZm");
  WidgetsFlutterBinding.ensureInitialized();

  // checkUserExists(){}
  //await dbHelper.init();
// red man ex
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
        create: (context) => CheckLoan(),
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    // child:
        GetMaterialApp(
          title: 'Splash Screen',
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            useMaterial3: true,
            primarySwatch: Colors.green,
          ),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
    //   ),
    // );
  }
}


