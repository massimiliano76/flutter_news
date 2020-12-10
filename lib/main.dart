import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/views/home_page.dart';
import 'package:flutter_news/data/data.dart';
import 'package:flutter_news/views/home_page_2.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(             
        primarySwatch: white,
        //primaryColor: Colors.white,
        brightness: brightness,        
      ),
      themedWidgetBuilder: (context, data) {
        return MaterialApp(          
          debugShowCheckedModeBanner: false,
          title: "Express News",
          color: Colors.white,
          theme: data,
          home: HomePage2(),
        );
      },
    );
  }
}
