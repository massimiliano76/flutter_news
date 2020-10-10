import 'package:flutter/material.dart';
import 'package:flutter_news/data/data.dart';
import 'package:flutter_news/helper_functions/trending_news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/categorie_model.dart';
import 'package:flutter_news/views/categorie_view.dart';
import 'package:flutter_news/widgets/widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategorieModel> categories = new List();
  List<ArticleModel> articles = new List();

  bool _loading;
  var newsList;

  void getTrendingNews() async {
    News news = News();
    await news.getTrendingNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;

    super.initState();
    categories = getCategories();
    getTrendingNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppName(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: _loading
            ? Center(child: Container(child: CircularProgressIndicator()))
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      //Categories
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 70,
                        child: ListView.builder(
                            itemCount: categories.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            itemBuilder: (context, index) {
                              return CategorieTile(
                                imgUrl: categories[index].imgUrl,
                                title: categories[index].categorieName,
                              );
                            }),
                      ),
                      //Blogs
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imageUrl: articles[index].urlToImage ?? "",
                                title: articles[index].title ?? "",
                                description: articles[index].description ?? "",
                                content: articles[index].content ?? "",
                                postUrl: articles[index].url ?? "",
                                author: articles[index].author,
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
