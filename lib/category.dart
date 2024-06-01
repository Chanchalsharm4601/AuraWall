import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/model/wallpapermodel.dart';
import 'package:wallpaper_app/search.dart';
import 'package:wallpaper_app/widget/widget.dart';

import 'data/data.dart';
import 'data/model/catagory_modell.dart';
import 'package:http/http.dart' as http;
class Categorie extends StatefulWidget {
final String categoryName;
Categorie(this.categoryName);
  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<wallpapermodel> Wallpapers = [];
  getSearchWallpapers(String searchQuery) async{

    var response = await http.get(Uri.parse('https://pixabay.com/api/?key=43910511-5f54e6ee22f467cbac65b6953&q=$searchQuery&image_type=photo&pretty=true&offset=100&page=1'),
        headers: {
          "Authorisation" : apiKey
        });
    print(response.body.toString());
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element){
      print(element);
      wallpapermodel WallpaperModel = wallpapermodel.fromMap(element);
      Wallpapers.add(WallpaperModel);


    });
    setState(() {

    });
  }
  @override
  void initState() {
    getSearchWallpapers(widget.categoryName);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BrandName(),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                  children: [
                    Container(height: 50.0,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0),),
                        color: Colors.blueGrey[50],

                      ),

                    ),


                    WallpapersList(Wallpapers,context)
                  ]
              )
          ),
        )

    );
  }
}
