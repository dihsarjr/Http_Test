import 'package:flutter/material.dart';
import 'package:http_test/http_provider.dart';
import 'package:http_test/model_post.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var httpProvider = Provider.of<HttpProvider>(context);
    Provider.of<HttpProvider>(context).getPost();

    return Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: httpProvider.posts == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.amber,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(httpProvider.posts[i].body),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text(httpProvider.posts[i].id.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(httpProvider.posts[i].title),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    httpProvider.posts[i].userId.toString()),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: httpProvider.posts.length,
                  ),
          ))
        ],
      ),
    );
  }
}
