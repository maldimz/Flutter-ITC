import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getapp/pages/page.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    // box.write('satu', 'pesan satu');

    //jangan lupa klo mau pake get widget
    return GetMaterialApp(
      title: 'Flutter Get',
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => PageSatu(), arguments: 
                  {
                    "data 1" : 1,
                    "data 2" : "Test",
                  }, transition: Transition.fade,
                );
              },
              icon: Icon(Icons.arrow_right))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Test"),
            ElevatedButton(
                onPressed: () {
                  Get.changeTheme(ThemeData.dark());
                },
                child: Text("Ganti Dark")),
            ElevatedButton(
                onPressed: () {
                  Get.changeTheme(ThemeData.light());
                },
                child: Text("Ganti tema light"))
          ],
        ),
      ),
    );
  }
}
