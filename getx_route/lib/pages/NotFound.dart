import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("404 Not Found"),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Get.back();
        }, child: Text("Back")),
      ),
    );
  }
}