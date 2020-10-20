import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/data/data.dart';
import 'package:flutter_news/helper_functions/trending_news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/categorie_model.dart';
//import 'package:flutter_news/views/categorie_view.dart';
import 'package:flutter_news/widgets/widget.dart';
import 'package:flutter_news/data/my_info.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategorieModel> categories = new List();
  List<ArticleModel> articles = new List();

  bool _loading;
  var newsList;
  bool _isSwitched = false;

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
        //backgroundColor: Colors.purple,
        elevation: 0.0,
        actions: [
          Switch(
            activeColor: Colors.white,
            //autofocus: true,
            //activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            value: _isSwitched,
            onChanged: (bool value) {
              toggleTheme();
              setState(() {
                _isSwitched = value;
              });
            },
          ),
        ],
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text("Press back again to exit"),
        ),
        child: SafeArea(
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
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 3),
                          child: ListView.builder(
                              itemCount: articles.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return NewsTile(
                                  imageUrl: articles[index].urlToImage ?? "",
                                  title: articles[index].title ?? "",
                                  description:
                                      articles[index].description ?? "",
                                  content: articles[index].content ?? "",
                                  postUrl: articles[index].url ?? "",
                                  author: articles[index].author ?? "",
                                  publishedAt:
                                      articles[index].publishedAt ?? "",
                                );
                              }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InfoScreen(),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  void toggleTheme() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}
