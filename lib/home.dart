import 'package:flutter/material.dart';
import 'package:http_test/http_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var httpProvider = Provider.of<HttpProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  httpProvider.getPost();
                },
                child: Text('Get'),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
