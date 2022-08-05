import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route/constant/page_constant.dart';

class PageTiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Get.parameters['id']);
    print(Get.parameters['name']);
    print(Get.parameters['age']);
    print(Get.parameters['uid']);
    return Scaffold(
      appBar: AppBar(title: Text("Page Tiga")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(PagesName.page1);
                },
                child: Text("Off All to Page Satu")),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    color: Colors.white,
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.music_note),
                            title: Text('Music'),
                            subtitle: Text("Pilih musik favorit"),
                            onTap: () {
                              Get.toNamed(PagesName.music);
                            }),
                        ListTile(
                          leading: Icon(Icons.videocam),
                          title: Text('Video'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ));
                },
                child: Text("Open bottom sheet"))
          ],
        ),
      ),
    );
  }
}
