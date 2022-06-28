import 'package:api_app/Homepage_delete.dart';
import 'package:api_app/Homepage_fbuilder.dart';
import 'package:api_app/Homepage_post.dart';
import 'package:api_app/Homepage_put.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomepageFbuilder(),
    );
  }
}