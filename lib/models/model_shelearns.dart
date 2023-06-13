class ModelShelearns {
  String? title;
  String? videoUrl;
  String? time;
  String? content;
  String? reads;
  String? lenght;
  List<dynamic>? categories;
  String? image;



  ModelShelearns({this.title, this.videoUrl, this.time,this.content,this.reads,this.lenght,this.categories,this.image});

  factory ModelShelearns.fromJson(Map<String, dynamic> responseData) {
    return ModelShelearns(

      title: responseData['title'],
      videoUrl: responseData['videoUrl'],
      time: responseData['time'],
      content: responseData['content'],
      reads:responseData['reads'],
      lenght:responseData['lenght'],
      categories:responseData['categories'],
      image: responseData["image"]


    );
  }

  @override
  String toString() {
    return 'FinanceArticle{title: $title, videoUrl: $videoUrl, time: $time, content: $content, reads: $reads, lenght: $lenght, categories: $categories, image: $image}';
  }
}