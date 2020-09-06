import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_test/model_post.dart';

class HttpProvider with ChangeNotifier {
  final url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPost() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      print(response.body);
    }
    notifyListeners();
  }
}
