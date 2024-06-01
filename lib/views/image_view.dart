
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;

  ImageView(this.imgUrl);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: widget.imgUrl,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.imgUrl, fit: BoxFit.cover),
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0x36FFFFFF),
                        Color(0x0FFFFFFF)
                      ]
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    _save();
                  },
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0x36FFFFFF),
                                    Color(0x0FFFFFFF)
                                  ]
                              ),
                              color: Colors.black45,
                              border: Border.all(color: Colors.white54, width: 1),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Set Wallpaper",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10.0,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Image will be saved in gallery",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 5.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }

  _save() async {
    if (Platform.isAndroid) {
      await _askPermission();
    }

    var response = await Dio().get(widget.imgUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      PermissionStatus status = await Permission.photos.request();
      if (status.isGranted) {
        print("Permission granted");
      } else {
        print("Permission denied");
      }
    } else {
      PermissionStatus status = await Permission.storage.request();
      if (status.isGranted) {
        print("Permission granted");
      } else {
        print("Permission denied");
      }
    }
  }
}
