import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controller/CounterController.dart';
import 'package:getx_app/controller/InputController.dart';
import 'package:getx_app/controller/OrangController.dart';
import 'package:getx_app/model/orang.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () => MaterialApp(
    //     title: 'Flutter Demo',
    //     home: Homepage2()
    //   ),
    // );
    return GetMaterialApp(
      title: 'test',
      home: HomeOrang(),
    );
  }
}

class HomeOrang extends StatelessWidget {
  final c = Get.put(CounterController());
  final orangC = Get.put(OrangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Orang"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => InputText());
              },
              icon: Icon(Icons.arrow_right))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("Nama ${orangC.orang.value.nama}")),
            Obx(() => Text("Angka ${c.count}")),
            ElevatedButton(
                onPressed: () {
                  orangC.changeName();
                  orangC.upperCase();
                },
                child: Text("Update")),
            TextField(
              onChanged: (value) {
                c.increment();
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}

class Homepage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GetX<CounterController>(
          init: CounterController(),
          builder: (controller) => Text("Angka ${controller.count}"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterController>().increment();
        },
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final getC = Get.put(InputController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Input Text"),
        ),
        body: TextField(controller: getC.inputC));
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
            GetX<CounterController>(
              builder: (controller) => Text("Angka getx ${controller.count}"),
            ),
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
