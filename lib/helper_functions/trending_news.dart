import 'dart:convert';
import 'package:flutter_news/data/data.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getTrendingNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&sortBy=publishedAt&language=en&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            //publishedAt: element["publishedAt"],
            content: element["content"],          
          );
          news.add(articleModel);
        }
      });
    }
  }
}
