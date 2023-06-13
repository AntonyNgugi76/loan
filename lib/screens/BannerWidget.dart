import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:she_banks/models/banner.dart';

class BannerImage extends StatelessWidget {
  final BannerModel banner;
  final VoidCallback onTap;

  BannerImage(this.banner, this.onTap);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.white),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    banner.images![0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: size.width * .5,
                color: banner.color,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        banner.shortContent!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 25,
                        width: 80,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.black,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              banner.buttonText!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      onTap: onTap,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
