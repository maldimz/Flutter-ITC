import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route/constant/page_constant.dart';
import 'package:getx_route/pages/PageTiga.dart';

class PageDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var item = Get.arguments;
    var id = item[1]['id'];
    var nama = item[1]['nama'];
    var umur = item[1]['umur'];
    return Scaffold(
      appBar: AppBar(title: Text("Page Dua")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nama : $nama"),
            Text("Umur : $umur"),
            ElevatedButton(
                onPressed: () {
                  Get.offNamed(
                      PagesName.page3 + "/$id/maldimz?name=$nama&age=$umur");
                },
                child: Text("Next Page")),
            ElevatedButton(
                onPressed: () {
                  Get.back(result: 'success');
                },
                child: Text("Back")),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      onConfirm: () {
                        print("Ok");
                        Get.back();
                      } ,
                      middleText: "Dialog made in 3 lines of code");
                },
                child: Text("Open Dialog")),
          ],
        ),
      ),
    );
  }
}
