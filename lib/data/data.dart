import 'package:flutter_news/models/categorie_model.dart';
import 'package:flutter/material.dart';

String apiKey = "36ddfae6e6474baebb50db8773f0bf3d";
const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

List<CategorieModel> getCategories() {
  List<CategorieModel> categories = new List();
  CategorieModel categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1190297/pexels-photo-1190297.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Entertainment";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Sports";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl = "https://images.pexels.com/photos/105028/pexels-photo-105028.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Health";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Business";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Technology";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl =
      "https://images.pexels.com/photos/1366944/pexels-photo-1366944.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categorieModel.categorieName = "Science";
  categories.add(categorieModel);
  categorieModel = new CategorieModel();




  return categories;
}
