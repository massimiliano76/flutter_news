import 'dart:convert';
//import 'dart:ffi';

//import 'package:flutter/material.dart';
import 'package:flutter_news/data/data.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class CategorieNews {
  List<ArticleModel> categorieNews = [];
  Future<void> getCategorieNews(String category) async {
    var url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&language=en&apiKey=$apiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null && element["publishedAt"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            publishedAt: element["publishedAt"],
          );
          categorieNews.add(articleModel);
        }
      });
    }
  }
}
