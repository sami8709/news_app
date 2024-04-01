

import 'package:flutter/material.dart';
import 'package:flutter_api2_app/api_services.dart';
// import 'package:flutter_api2_app/api_services.dart';
// import 'package:flutter_api2_app/main.dart';

class searchnews extends StatefulWidget {
  const searchnews({super.key});

  @override
  State<searchnews> createState() => _searchnewsState();
}

class _searchnewsState extends State<searchnews> {
  TextEditingController _searchController = TextEditingController();
  var apiendpoint = 'https://newsapi.org/v2/everything';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter News App'),
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search News',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        String enteredText = _searchController.text;
                        setState(() {
                          apiendpoint =
                              'https://newsapi.org/v2/everything'; // Reset to the default
                        });
                        if (enteredText.isNotEmpty) {
                          // If user input is not empty, update the API endpoint
                          setState(() {
                            apiendpoint = 'https://newsapi.org/v2/everything';
                          });
                        }
                        fetchNews(enteredText);
                        // fetchNews(enteredText);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => YourNewsWidget()));
                      },
                    ),
                  ))),
        ]));
  }
}
