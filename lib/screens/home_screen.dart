import 'package:flutter/material.dart';
import 'package:news/helper/data.dart';
import 'package:news/models/category.dart';
import 'package:news/helper/news.dart';
import 'package:news/models/article.dart';
import 'package:news/screens/category.dart';

import 'article_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = List<Category>();
  List<Article> articles = List<Article>();
  News news = News();
  getAndSetNews() async {
    await news.getNewsHeadlines("in");
    articles = news.articles;
    setState(() {});
  }

  @override
  void initState() {
    categories = getCategoryData();
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
          '#nustaNews',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    shrinkWrap: true,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      return NewsCategoryTile(
                          categories[index].imgUrl, categories[index].label);
                    }),
              ),
              ListView.builder(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCategoryTile extends StatelessWidget {
  final String imgUrl, label;
  NewsCategoryTile(this.imgUrl, this.label);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(label)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imgUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 60,
              width: 120,
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  NewsTile({this.title, this.description, this.url, this.imageUrl});
  final String title, description, url, imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ArticleView(url)));
        print(url);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 180,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
