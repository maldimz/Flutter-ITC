import 'package:get/get.dart';

class CounterController extends GetxController{
  var count = 0.obs;
  var darkTheme = false.obs;

  increment() => count++;
  decrement() => count--;

  changeTheme() => darkTheme.value = !darkTheme.value;
}