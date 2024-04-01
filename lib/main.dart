import 'package:flutter/material.dart';
import 'package:flutter_api2_app/api_services.dart';
import 'package:flutter_api2_app/model_class.dart';
import 'package:flutter_api2_app/search_new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: searchnews()
      ),
    );
  }
}


class YourNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsArticle>>(
      future: fetchNews('query'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No news available'));
        } else {
          final List<NewsArticle> articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final NewsArticle article = articles[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.description ?? ''),
                  onTap: () {
                    // Handle item click if needed
                    print('Clicked on ${article.title}');
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
