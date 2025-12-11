import 'package:http/http.dart' as http;
import 'Baitap/model/post_model.dart'; 
import 'dart:convert';

const String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=dbf5dc49cb9c4de3a2e79d9fec4673a8';

Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> postItems = jsonResponse['articles']; 

    return postItems.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}