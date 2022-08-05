import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route/constant/page_constant.dart';
import 'package:getx_route/controller/route_controller.dart';
import 'package:getx_route/pages/NotFound.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      unknownRoute: GetPage(name: PagesName.notFound, page: () => NotFound()),
      getPages: PagesRoute.pages,
      initialRoute: PagesName.page1,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PageSatu(),
    );
  }
}