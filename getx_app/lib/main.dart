import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controller/CounterController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        title: 'Flutter Demo',
        theme: counterC.darkTheme.value ? ThemeData.dark() : ThemeData.light(),
        home: Homepage(),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  final c = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GETX Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("ANGKA ${c.count}")),
            ElevatedButton(
                onPressed: () {
                  c.increment();
                },
                child: Text("Tambah")),
            ElevatedButton(
                onPressed: () {
                  c.decrement();
                },
                child: Text("Kurang")),
            ElevatedButton(
                onPressed: () {
                  c.changeTheme();
                },
                child: Text("Ganti Tema")),
          ],
        ),
      ),
    );
  }
}
