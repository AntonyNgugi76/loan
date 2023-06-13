import 'package:algolia/algolia.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:she_banks/models/model_news.dart';
import 'package:she_banks/models/model_shelearns.dart';
import 'package:she_banks/screens/colors.dart';
import 'package:she_banks/screens/screen_she_learns_details.dart';
import 'package:she_banks/screens/sheiq_questions.dart';

class ScreenSheLearns extends StatefulWidget {
  _HealtResourceState createState() => _HealtResourceState();
}

class _HealtResourceState extends State<ScreenSheLearns> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              largeTitle: Text('SHE Learns'),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 48,
                // ),
                // Container(
                //   height: 44,
                //   padding: EdgeInsets.only(left: 16, right: 8),
                //   decoration: new BoxDecoration(
                //     border: Border.all(color: Colors.grey[400]!, width: .8),
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(50),
                //     ),
                //     // color: HexColor('#D60812'),
                //   ),
                //   child: InkWell(
                //     onTap: () {},
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Text(
                //             'What are you looking to learn?',
                //             style: TextStyle(
                //                 fontSize: 13, color: Colors.grey[500]),
                //           ),
                //         ),
                //         Container(
                //           height: 30,
                //           width: 30,
                //           child: Row(
                //             children: [
                //               Expanded(
                //                 child: Icon(
                //                   Icons.arrow_forward,
                //                   size: 16,
                //                   color: Colors.grey[500],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                // Text(
                //   'Categories',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 22,
                //       fontWeight: FontWeight.bold),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Chip(
                //         backgroundColor: MyColors().primaryColor,
                //         label: Container(
                //             width: 60,
                //             child: Text(
                //               'All',
                //               style: TextStyle(color: Colors.white),
                //             ))),
                //     Chip(label: Text('Investment')),
                //     Chip(label: Container(width: 60, child: Text('Money'))),
                //   ],
                // ),
                Container(
                  child: FutureBuilder<List<ModelShelearns>>(
                      future: _getArticles(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ModelShelearns> news_list = snapshot.data!;

                          if (news_list.isNotEmpty) {
                            //  return info_body(SheIQquestions().sample_news);
                            return info_body(news_list);
                          } else {
                            return Center(child: Text('No news available'));
                          }
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error'),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget info_body(List<ModelShelearns> health_resources) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: health_resources.length,
      itemBuilder: (context, index) {

        ModelShelearns news = health_resources[index];

        return Container(
          margin: EdgeInsets.only(bottom: 4, top: 4),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShelearnsDetails(news),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: CachedNetworkImage(
                    imageUrl: news.image!,
                    fit: BoxFit.cover,
                    height: 120,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              news.title!,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${news.content}',
                              maxLines: 3,
                              style: TextStyle(fontSize: 11),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<List<ModelShelearns>> _getArticles() async {
    List<ModelShelearns> articlesResults = [];
    List<ModelShelearns> articles = [];
    Algolia algolia = Application.algolia;
    print('here sap');



    try {
      AlgoliaQuery query = algolia.instance.index('finance_articles');
      query.setHitsPerPage(20);
      AlgoliaQuerySnapshot snap = await query.getObjects();

      snap.hits.forEach((element) {
        print(element.data);
        Map<String, dynamic> data = element.data;

        ModelShelearns shelearns = ModelShelearns.fromJson(data);
        print(shelearns.categories);

        articles.add(shelearns);
      });

      articlesResults.addAll(articles);

      print(articlesResults.toString());
    } catch (algoliaError) {
      print("error " + algoliaError.toString());
    }

    return articlesResults;
  }
}

class Application {
  static final Algolia algolia = Algolia.init(
    applicationId: '8PPUXWB209',
    apiKey: 'fbded216413a8d81f6ad86d74bed8723',
  );
}
