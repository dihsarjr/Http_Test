import 'package:flutter/cupertino.dart';
import 'package:http_test/model_post.dart';

class HttpProvider with ChangeNotifier {
  final url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPost() async {}
}
