

class wallpapermodel{
  late String user;
  late int user_id;
  late String webformatUrl;
  late String largeImageURL;
  late String previewURL;

  wallpapermodel(
      // this.user,this.user_id,
      this.webformatUrl,
      // this.largeImageURL,
      // this.previewURL
      );

  factory wallpapermodel.fromMap(Map<String,dynamic> jsonData){
    return wallpapermodel(
        // jsonData["user"],
        // jsonData["user_id"],
        jsonData["webformatURL"],
        // jsonData["largeImageURL"],
        // jsonData["previewURL"]
    );
  }
}
