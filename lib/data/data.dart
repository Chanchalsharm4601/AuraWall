import 'package:wallpaper_app/data/model/catagory_modell.dart';

String apiKey = "43910511-5f54e6ee22f467cbac65b6953";

List<CategoriesModel> GetCategories(){
  List<CategoriesModel> categories = [];
  // List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel= new CategoriesModel();

  categoriesModel.imgUrl = 'https://images.pexels.com/photos/23221538/pexels-photo-23221538/free-photo-of-a-white-flower-with-green-leaves-in-the-dark.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'flower';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = 'https://images.pexels.com/photos/23279639/pexels-photo-23279639/free-photo-of-a-solar-eclipse-is-seen-in-the-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'moon';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = 'https://images.pexels.com/photos/21905722/pexels-photo-21905722/free-photo-of-a-man-in-a-helmet-and-backpack-standing-on-top-of-a-mountain.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'mountains';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = 'https://images.pexels.com/photos/22134724/pexels-photo-22134724/free-photo-of-a-woman-sitting-on-a-rock-with-her-hands-on-her-head.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'modeling';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = 'https://images.pexels.com/photos/21905722/pexels-photo-21905722/free-photo-of-a-man-in-a-helmet-and-backpack-standing-on-top-of-a-mountain.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'mountains';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = 'https://images.pexels.com/photos/22134724/pexels-photo-22134724/free-photo-of-a-woman-sitting-on-a-rock-with-her-hands-on-her-head.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'modeling';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = 'https://images.pexels.com/photos/23279639/pexels-photo-23279639/free-photo-of-a-solar-eclipse-is-seen-in-the-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'moon';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = 'https://images.pexels.com/photos/23221538/pexels-photo-23221538/free-photo-of-a-white-flower-with-green-leaves-in-the-dark.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  categoriesModel.categoriesName = 'flower';
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();


  return categories;

}
