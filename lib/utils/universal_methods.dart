import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class UniversalMethods {
  static const color_purple = '#0f305e';
  static const colorPrimary = '#ed39ca';

  static const color_orange = '#D60812';

  static String get_current_date() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);
    return formattedDate;
  }


  static String amount_commas(s) {
    String val='0';
    if(s==null){
      val='0';
    }else{
      val=  s.toString();
    }
    return NumberFormat.decimalPattern().format(
      int.parse(val),
    );
  }
  static String get_formarted_date(String date, int formart) {
    String d1 = '';
    if (formart == 1) {
      DateFormat format = DateFormat("yyyy-MM-dd");
      DateTime x = format.parse(date);
      d1 = DateFormat('yyyy-MM-dd kk:mm').format(x);
      return d1;
    } else if (formart == 2) {
      DateFormat format = DateFormat("yyyy-MM-dd");
      DateTime x = format.parse(date);
      d1 = DateFormat('yyyy-MM-dd').format(x);
      return d1;
    }

    return d1;
  }

  static int get_current_timestamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  showLoaderDialog(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${message}",
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[900],
                overflow: TextOverflow.ellipsis),
          ),
          SizedBox(
            height: 8,
          ),
           Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(
                child: CircularProgressIndicator(strokeWidth: .7,),
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 7),
                child: Text(
                  "Please wait ...",

                  style: TextStyle(
                    fontSize: 12,
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void show_toast(String message,context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.pink,
        duration: const Duration(milliseconds: 4000), // default 4s
        content:  Text('${message}'),
      ),
    );
  }

  static String sanitize_null_strings(String? s) {
    if (s == null) {
      return "";
    } else {
      return s;
    }
  }

  static String convert_phone_number(String s) {
    if (s.isNotEmpty) {
      if (s.length != 10) {
        return "E";
      } else {
        int numSpace = 1;
        String result = s.replaceRange(0, numSpace, '+254');
        return result;
      }
    } else {
      return "E";
    }
  }

  static List<String> getMonthsInYear(DateTime userCreatedDate) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    final dates = <String>[];
    final now = DateTime.now();
    final sixMonthFromNow = DateTime(now.year, now.month + 6);
    DateTime date = userCreatedDate;

    while (date.isBefore(sixMonthFromNow)) {
      dates.add(dateFormat.format(date));
      date = DateTime(date.year, date.month + 1);
    }
    return dates;
  }

  static String create_2_user_id(String user1, String user2) {
    var chatID = (user1.compareTo(user2) < 0 ? user1 + user2 : user2 + user1);
    return chatID;
  }

  static String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static String displayTimeAgoFromTimestamp(String dateString,
      {bool numericDates = true}) {
    DateTime date = DateTime.parse(dateString);
    final date2 = DateTime.now();
    final difference = date2.difference(date);
    print('${(difference.inDays / 30).floor()} dddddd ');

    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  static String formatTimestamp(timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    String _date = DateFormat.yMMMd().format(date);
    print(_date);
    return _date;
  }

  static String formatTimestamp_to_date(timestamp) {
    var format = new DateFormat('kk:mm');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    String _date = format.format(date);
    print(_date);
    return _date;
  }

  static calculate_bmi(heights, weight) {
    var height;
    if (heights['mode'] == 'CM') {
      height = heights['cm'];
    } else if (heights['mode'] == 'FT') {
      height = (heights['h1'] * 30.48) + (heights['h2'] * 2.54);
    } else {
      height = 0;
    }

    if (height == 0 && weight == 0) {
      return 'N/A';
    }
    var bmi = weight / ((height / 100) * (height / 100));
    return bmi.toStringAsFixed(1);
  }

  static calculate_age(String? dob) {
    print(dob);
    if (dob == null || dob.isEmpty) {
      return 'N/A';
    }
    DateTime birthday = new DateFormat("dd/MM/yyyy").parse(dob);

    // final birthday = DateTime(1967, 10, 12);
    final date2 = DateTime.now();
    final difference = (date2.difference(birthday).inDays) / 365.25;
    return '${difference.toStringAsFixed(0)} years';
  }

  String folder_loca(int? _doc_type) {
    String _folder_location = '';

    if (_doc_type == 1) {
      _folder_location = 'doctors_notes';
    } else if (_doc_type == 2) {
      _folder_location = 'doctors_prescriptions';
    } else if (_doc_type == 3) {
      _folder_location = 'medications';
    } else if (_doc_type == 4) {
      _folder_location = 'scans';
    } else if (_doc_type == 5) {
      _folder_location = 'hospitalvisits';
    } else if (_doc_type == 6) {
      _folder_location = 'invoice_reciepts';
    } else {
      _folder_location = 'any_file';
    }

    return _folder_location;
  }

  String set_up_height(String data) {
    Map valueMap = {};
    String height;
    int cm;
    int h1;
    int h2;
    String mode;
    if (data.isNotEmpty) {
      valueMap = json.decode(data);
      cm = valueMap['cm'];
      h1 = valueMap['h1'];
      h2 = valueMap['h2'];
      mode = valueMap['mode'];

      if (mode == 'CM') {
        height = '${cm} CM';
      } else if (mode == 'FT') {
        height = '${h1}`${h2}';
      } else {
        return '';
      }
    } else {
      height = '';
    }

    return height;
  }

  static get_weight(Map _height) {
    dynamic height = 0.0;

    if (_height.isEmpty) {
      height = 0;
    }
    if (_height['mode'] == 'CM') {
      height = _height['cm'];
    } else if (_height['mode'] == 'FT') {
      height = (_height['h1'] * 30.48) + (_height['h2'] * 2.54);
    } else {
      height = 0;
    }

    return height;
  }
}
