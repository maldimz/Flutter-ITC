import 'package:get/get.dart';

class CounterController extends GetxController{
  var count = 0.obs;
  var darkTheme = false.obs;

  increment() => count++;
  decrement() => count--;

  changeTheme() => darkTheme.value = !darkTheme.value;

  @override
  void onInit() {
    print("OnInit");

    interval(count, (_) => print("Perintah Search APi : sss"), time: Duration(seconds: 1));;
    super.onInit();
  }
}