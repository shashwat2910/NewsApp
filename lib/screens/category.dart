import 'package:flutter/material.dart';
import 'package:news/helper/data.dart';
import 'package:news/models/category.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article.dart';
import 'package:news/screens/category.dart';
import 'home_screen.dart';
class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen(this.category);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Article> articles = List<Article>();
  News news = News();

  getAndSetNews() async {
    await news.getNewsByCategory("in", widget.category.toLowerCase());
    articles = news.articles;
    setState(() {});
  }

  @override
  void initState() {
    getAndSetNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.white54,
        centerTitle: true,
        title: Text(
          '#${widget.category} News',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: articles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return NewsTile(
              title: articles[index].title,
              description: articles[index].description,
              imageUrl: articles[index].urlToImage,
              url: articles[index].url,
            );
          },
        ),
      ),
    );
  }
}
