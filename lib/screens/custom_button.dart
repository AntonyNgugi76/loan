import 'package:flutter/material.dart';

const Color primaryColor=Color.fromRGBO(249, 98, 158,1.0);
class CustomButton{
  custom_button(){
   return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          height: 40.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: primaryColor,
            color: primaryColor,
            elevation: 7.0,
            child: Text(
              'APPLY FOR LOAN',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
