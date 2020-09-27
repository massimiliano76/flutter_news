import 'package:flutter/material.dart';
import 'package:flutter_news/views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News",
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}
