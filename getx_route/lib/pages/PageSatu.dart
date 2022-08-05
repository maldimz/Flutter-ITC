import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route/constant/page_constant.dart';

class PageSatu extends StatelessWidget {
  var items = [
    {"id": 1, "nama": "test nama", "umur": 2},
    {"id": 2, "nama": "test nama 2", "umur": 3}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Satu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Get.rawSnackbar(message: "Login Sukses");
                  var data =
                      await Get.toNamed(PagesName.page2, arguments: items);
                  if (data == 'success') {
                    Get.snackbar("Notification", "Pembayaran anda berhasil",
                        borderRadius: 5.0, backgroundColor: Colors.red);
                  }
                },
                child: Text("Next Page"))
          ],
        ),
      ),
    );
  }
}
