import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/views/categorie_view.dart';
import 'package:flutter_news/views/web_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: "Flutter",
          style: GoogleFonts.roboto(
              //color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        TextSpan(
          text: "News",
          style: GoogleFonts.roboto(
              //color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        )
      ])),
    );
  }
}

class CategorieTile extends StatelessWidget {
  String imgUrl;
  String title;
  CategorieTile({this.imgUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => categorieView(
                      category: title.toLowerCase(),
                    )));
      },
      child: Container(
        height: 55,
        width: 120,
        margin: EdgeInsets.only(right: 5),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
                height: 55,
                width: 120,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 55,
                width: 120,
                color: Colors.black26,
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
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
  _launchURL(String URLtoNews) async {
    if (await canLaunch(URLtoNews)) {
      launch(URLtoNews);
    } else {
      throw 'Cannot launch url';
    }
  }

  NewsTile(
      {this.imageUrl,
      this.title,
      this.description,
      this.content,
      @required this.postUrl,
      this.author});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (kIsWeb) {
          _launchURL(postUrl);
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebViewNews(
                        NewsURL: postUrl,
                      )));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 2.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      //height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 4.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                    child: Text(
                      description,
                      maxLines: 2,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
