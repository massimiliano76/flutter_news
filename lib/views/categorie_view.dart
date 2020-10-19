import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helper_functions/get_categorie_news.dart';
//import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/widgets/widget.dart';

class categorieView extends StatefulWidget {
  final String category;

  categorieView({this.category});

  @override
  _categorieViewState createState() => _categorieViewState();
}

class _categorieViewState extends State<categorieView> {
  var categorylist;
  bool _loading;
  bool isSwitched = false;

  void getNews() async {
    CategorieNews categorieNews = new CategorieNews();
    await categorieNews.getCategorieNews(widget.category);
    categorylist = categorieNews.categorieNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppName(),
        //backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        // iconTheme: IconThemeData(
        //   color: Colors.black
        // ),
        actions: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              toggleTheme();
              setState(() {
                isSwitched = value;
              });
            },
          )
        ],
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //margin: EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                          itemCount: categorylist.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              postUrl: categorylist[index].url ?? "",
                              imageUrl: categorylist[index].urlToImage ?? "",
                              description:
                                  categorylist[index].description ?? "",
                              title: categorylist[index].title ?? "",
                              author: categorylist[index].author ?? "",
                              content: categorylist[index].content ?? "",
                            );
                          }),
                    ),
                    SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ),
            ),
    );
  }
void toggleTheme() {
  DynamicTheme.of(context).setBrightness(
    Theme.of(context).brightness == Brightness.dark ? Brightness.light : Brightness.dark);
  
}

}
