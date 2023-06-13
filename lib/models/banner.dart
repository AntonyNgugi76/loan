import 'package:flutter/material.dart';

class BannerModel {

  int? id;
  String? title;
  String? shortContent;
  String? longContent;
  bool? isAppFunction;
  String? buttonText;
  List<dynamic>? images;
  String? function;
  Color? color;
  BannerModel(
      {this.id,
        this.title,
        this.shortContent,
        this.longContent,
        this.isAppFunction,
        this.buttonText,
        this.images,
        this.function,
        this.color
      });

  factory BannerModel.fromJson(Map<String, dynamic> responseData) {
    return BannerModel(
      id: responseData['id'],
      title: responseData['title'],
      shortContent: responseData['short_text'],
      longContent: responseData['long_text'],
      isAppFunction: responseData['App_function'],
      buttonText:responseData['button'] ,
      images: responseData['images'],
      function: responseData['App_function'],
        color: responseData['color']


    );
  }
}
