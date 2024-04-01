import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api2_app/model_class.dart';

// Future<List<NewsArticle>> fetchNews(String user) async {
//   final apiendponi= 
//   final response = await http.get(
//     Uri.parse(
//       ' setState(() {
//                       _apiEndpoint =
//                           'https://newsapi.org/v2/everything'; // Reset to the default
//                     })?q=$user&apiKey=1d0ba031ae9447aba06ea636a83589bc',
//     ),
    
//   );

  Future<List<NewsArticle>> fetchNews(String query) async {

    final apiKey = "1d0ba031ae9447aba06ea636a83589bc";
    final url = "https://newsapi.org/v2/everything?q=$query";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $apiKey",
        // Include other headers if needed
      },
    );
  // final response = await http.get('https://newsapi.org/v2/everything?q=bitcoin&apiKey=1d0ba031ae9447aba06ea636a83589bc' );
  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
    return newsResponse.articles;
  } else {
    throw Exception('Failed to load news');
  }
}
