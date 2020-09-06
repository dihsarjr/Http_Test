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
    Provider.of<HttpProvider>(context).getPost().then((value) {
      setState(() {
        data = value;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: data == null
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
                                child: Text(data[i].body),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data[i].id.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data[i].title),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data[i].userId.toString()),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data.length,
                  ),
          ))
        ],
      ),
    );
  }
}
