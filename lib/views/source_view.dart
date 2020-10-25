import 'package:flutter/material.dart';
import 'package:flutter_news/helper_functions/get_source_news.dart';
import 'package:flutter_news/widgets/widget.dart';

class NewsFromSources extends StatefulWidget {
  final newsSource;
  NewsFromSources({this.newsSource});

  @override
  _NewsFromSourcesState createState() => _NewsFromSourcesState();
}

class _NewsFromSourcesState extends State<NewsFromSources> {
  var sourcelist;
  bool _loading;

  void getsourcenews() async {
    SourceNews sourceNews = new SourceNews();
    await sourceNews.getSourceNews(widget.newsSource);
    sourcelist = sourceNews.sourcenews;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    getsourcenews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppName(),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(strokeWidth: 4.0,backgroundColor: Colors.transparent , valueColor: AlwaysStoppedAnimation(Colors.purpleAccent[700],)
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: sourcelist.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: ( context, index) {
                            return NewsTile(
                              postUrl: sourcelist[index].url ?? "",
                              imageUrl: sourcelist[index].urlToImage ?? "",
                              description:sourcelist[index].description ?? "",
                              title: sourcelist[index].title ?? "",
                              author: sourcelist[index].author ?? "",
                              content: sourcelist[index].content ?? "",
                              publishedAt: sourcelist[index].publishedAt ?? "",
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ));
  }
}
