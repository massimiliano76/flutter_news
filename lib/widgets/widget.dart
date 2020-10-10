import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Flutter", style: TextStyle(color: Colors.black),),
        Text(
          "News",
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}

class CategorieTile extends StatelessWidget {
  String imgUrl;
  String title;
  CategorieTile({this.imgUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      margin: EdgeInsets.only(right: 5),
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
                height: 60,
                width: 120,
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 60,
              width: 120,
              color: Colors.black26,
              alignment: Alignment.center,
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget articlesList({List<ArticleModel> articles, context}) {
  return Container(
    child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ListTile();
        }),
  );
}

class NewsTile extends StatelessWidget {
  final imageUrl, title, description, content, postUrl, author;

  NewsTile(
      {this.imageUrl,
      this.title,
      this.description,
      this.content,
      @required this.postUrl,
      this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      //margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width,
      child: Container(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  child: Text(
                    description,
                    maxLines: 2,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
