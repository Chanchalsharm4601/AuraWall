import 'dart:convert';

import 'views/image_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app/data/model/wallpapermodel.dart';
import 'package:wallpaper_app/search.dart';
import 'package:wallpaper_app/widget/widget.dart';

import 'category.dart';
import 'data/data.dart';
import 'data/model/catagory_modell.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<wallpapermodel> Wallpapers = [];
  TextEditingController searchController = new TextEditingController();

  getTrendingWallpapers() async{
    
    var response = await http.get(Uri.parse('https://pixabay.com/api/?key=43910511-5f54e6ee22f467cbac65b6953&q=&image_type=photo&pretty=true&order=latest&per_page=200'),
    headers: {
      "Authorisation" : apiKey
    });
    print(response.body.toString());
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element){
      // print(element);
      wallpapermodel WallpaperModel = wallpapermodel.fromMap(element);
    Wallpapers.add(WallpaperModel);


    });
    setState(() {

    });
  }


  @override
  void initState(){
    getTrendingWallpapers();
    categories = GetCategories();
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

                //text field

                Container(
                  height: 50.0,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0),),
                    color: Colors.blueGrey[50],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'search Wallpaper',
                            border: InputBorder.none
                            ,)
                        ),
                      ),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                                searchQuery: searchController.text,
                            )
                            )
                            );

                          },
                          child: Icon(Icons.search)),
                    ],
                  ),
                ),

                //text field

                SizedBox(height: 16.0,),

                // LIST OF CATEGORIES

                Container(
                  height: 80,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategoriesTile(
                        categories[index].imgUrl,
                        categories[index].categoriesName,

                      );

                    } ),
                ),

                SizedBox(height: 16.0,),


                WallpapersList(Wallpapers,context)

                //END OF LIST OF CATEGORIES

              ],
            ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {

  final String imgUrl;
  final String category;
  CategoriesTile(@required this.imgUrl, this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Categorie(category.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 6.0),
        child: Stack(children: [
          ClipRRect(
                borderRadius: BorderRadius.circular(10),
                    child: Image.network(imgUrl, height: 50, width: 90,fit: BoxFit.cover
                    )),


          Container(
            color: Colors.black12,
            height: 50, width: 90,
            alignment: Alignment.center,
            child: Text(category, style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 11.0
      
            ),),
          ),
]
        )
      ),
    );
  }
}
