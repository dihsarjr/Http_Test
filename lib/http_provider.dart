import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_test/model_post.dart';

class HttpProvider with ChangeNotifier {
  final url = 'https://jsonplaceholder.typicode.com/posts';
  List<Post> posts = [];

  Future<List<Post>> getPost() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      posts = body.map((dynamic item) => Post.fromJson(item)).toList();

      print(response.body);
      return posts;
    } else {
      // throw 'Something is Wrong';
      print('Something wrong');
    }

    notifyListeners();
  }

  notifyListeners();
}
