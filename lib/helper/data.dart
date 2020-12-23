import 'package:news/models/category.dart';

List<Category> getCategoryData() {

  List<Category> categories = List<Category>();
  Category category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1450101499163-c8848c66ca85?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.label = "Business";
  categories.add(category);

  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80";
  category.label = "Entertainment";
  categories.add(category);


  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1498644035638-2c3357894b10?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80";
  category.label = "General";
  categories.add(category);

  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80";
  category.label = "Health";
  categories.add(category);

  category = Category();
  category.imgUrl = "https://images.unsplash.com/photo-1522778526097-ce0a22ceb253?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.label = "Sports";
  categories.add(category);
  return categories;
}