import 'dart:convert';
import 'package:flutter_news/data/data.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class SourceNews {
  List<ArticleModel> sourcenews = [];
  Future<void> getSourceNews(String source) async {
    var url =
        "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=$apiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null && element["publishedAt"] != null) {
          ArticleModel articleModel = new ArticleModel(
            title: element["title"],
            urlToImage: element["urlToImage"],
            description: element["description"],
            content: element["content"],
            url: element["url"],
            author: element["author"],
            publishedAt: element["publishedAt"],
          );
          sourcenews.add(articleModel);
        }
      });
    }
  }
}
