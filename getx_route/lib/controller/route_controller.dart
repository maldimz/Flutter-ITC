import 'package:get/get.dart';
import 'package:getx_route/constant/page_constant.dart';
import 'package:getx_route/pages/PageMusic.dart';

import '../pages/PageDua.dart';
import '../pages/PageSatu.dart';
import '../pages/PageTiga.dart';

class PagesRoute {
  static var pages = [
    GetPage(name: PagesName.page1, page: () => PageSatu()),
    GetPage(name: PagesName.page2, page: () => PageDua()),
    GetPage(name: PagesName.page3 + "/:id/:uid", page: () => PageTiga()),
    GetPage(name: PagesName.music, page: () => PageMusic())
    //getpage pagesname.page4, page --- pageempat();
  ];
}
