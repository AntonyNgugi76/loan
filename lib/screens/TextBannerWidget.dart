import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:she_banks/models/banner.dart';
import 'package:she_banks/screens/colors.dart';

class BannerText extends StatelessWidget {
  final BannerModel banner;
  final VoidCallback onTap;

  BannerText(this.banner, this.onTap);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.white),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pending loan',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                          'Pay your loan of ksh 2000 to increase your loan limit',style: TextStyle(fontSize: 13),),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 25,
                      width: 80,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.black,
                        color: MyColors().primaryColor,
                        child: Center(
                          child: Text(
                            'Pay now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    onTap: onTap,
                  ),
                  // Container(
                  //   width: size.width * .5,
                  //   color: Colors.white,
                  //   child: Column(
                  //     children: [
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       Center(
                  //           child: Padding(
                  //         padding: EdgeInsets.only(left: 10, right: 10),
                  //         child: Text(
                  //           banner.shortContent!,
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 12,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //           maxLines: 3,
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       )),
                  //       SizedBox(
                  //         height: 10,
                  //       ),
                  //
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
