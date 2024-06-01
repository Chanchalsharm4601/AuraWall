import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/image_view.dart';
import '../data/model/wallpapermodel.dart';
import 'package:wallpaper_app/views/image_view.dart';
import 'package:wallpaper_app/main.dart';

Widget BrandName(){
  return RichText(
    textAlign: TextAlign.end,
    text: TextSpan(
      style: TextStyle(),
      children: const <TextSpan>[
        TextSpan(text: 'Wall',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black,fontSize: 20,)),
        TextSpan(text: 'Flair', style: TextStyle(fontWeight: FontWeight.w900,color: Colors.blue,fontSize: 20)),
      ],
    ),
  );
  // return Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Text('Wallpaper',style: TextStyle(
  //       fontSize: 20.0,
  //       fontWeight: FontWeight.bold
  //     ),),
  //     Text('Hub',style: TextStyle(
  //        fontSize: 20.0,
  //      fontWeight: FontWeight.bold,
  //      color: Colors.blue,))
  // ],
  // );
}

WallpapersList(List<wallpapermodel> Wallpapers, context) {
  return Container(
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      padding: EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: Wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageView(wallpaper.webformatUrl
              )));
            },
            child: Hero(
              tag: wallpaper.webformatUrl,
              child: Container(
                child: Container(
                    child: ClipRRect
                      (borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(wallpaper.webformatUrl,fit: BoxFit.cover))
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

