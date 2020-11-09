import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/models/categorie_model.dart';
import 'package:flutter_news/views/categorie_view.dart';
import 'package:flutter_news/views/source_view.dart';
import 'package:flutter_news/views/web_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:dynamic_theme/dynamic_theme.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      child: RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: "Flutter",
          style: GoogleFonts.roboto(
              color: Colors.blue[600],
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8),
        ),
        TextSpan(
          text: "News",
          style: GoogleFonts.roboto(
              color: Colors.blue[600],
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8),
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
        margin: EdgeInsets.only(
          right: 5,
          top: 10,
        ),
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

class NewsTile extends StatelessWidget {
  final imageUrl, title, description, content, postUrl, author, publishedAt;
  _launchURL(URLtoNews) async {
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
      this.author,
      this.publishedAt});

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
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                  child: Text(
                    description,
                    maxLines: 2,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.0),
                    child: Text(
                      getDate(publishedAt),
                      style: GoogleFonts.roboto(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget newsList({List<CategorieModel> categories, context}) {
  return Container(
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: .2,
      shrinkWrap: true,
      children: categories.map((e) {
        return GridTile(
          child: CategorieTile(
            imgUrl: e.imgUrl,
            title: e.categorieName,
          ),
        );
      }).toList(),
    ),
  );
}

String getDate(String utc) {
  var date = DateTime.parse(utc);
  DateTime local = date.toLocal();
  return 'Date: ${local.day}/${local.month}/${local.year}  Time: ${local.hour}:${local.minute}:${local.second}';
}

class CategorieTile2 extends StatelessWidget {
  String imgUrl;
  String title;
  CategorieTile2({this.imgUrl, this.title});

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
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategorieTile3 extends StatelessWidget {
  String imgUrl;
  String title;
  CategorieTile3({this.imgUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsFromSources(
                      newsSource: title.toLowerCase(),
                    )));
      },
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        //padding: EdgeInsets.symmetric(vertical: 16.0),
        margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),

        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.cover,
                height: 100,
                width: MediaQuery.of(context).size.width,
                
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.black26,
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.transparent,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,                    
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
