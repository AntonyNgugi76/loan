import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:she_banks/screens/screen_home.dart';
import 'package:she_banks/screens/screen_login.dart';
import 'package:she_banks/screens/screen_registration.dart';
import 'package:she_banks/screens/loginPass.dart';
import '../models/FirebaseModel.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _anime_controller;
  late bool? userExists;

  FirebaseAuth auth = FirebaseAuth.instance;

  // CollectionReference? users;
  setUserBool() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    userExists= _prefs.getBool('userExists');

  }
  storeHasLoan() async{
    SharedPreferences _prefs =await SharedPreferences.getInstance();
    _prefs.setBool('hasExistingLoan', false);
  }

  @override
  void initState() {
    setUserBool();
    // TODO: implement initState
    super.initState();

    const anime_duration = 2;

    _anime_controller = AnimationController(
        duration: const Duration(seconds: anime_duration),
        reverseDuration: Duration(seconds: anime_duration),
        vsync: this);
    animation = Tween<double>(begin: 30, end: 150).animate(_anime_controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _anime_controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _anime_controller.forward();
      }
    });
    _anime_controller.forward();
  }

  _move_to_next() {
    const duration = 3;
    var user = auth.currentUser;

    Timer(Duration(seconds: duration), () async {
      // var user = auth.currentUser;

      if (userExists == null || userExists==false) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => AccountLogin(),
            ),
          );

      } else {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => const LoginPass()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _move_to_next();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Container(
                      height: animation.value,
                      width: animation.value,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 110,
                        child: CircleAvatar(
                          radius: 110,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _anime_controller.dispose();
    super.dispose();
  }
}
