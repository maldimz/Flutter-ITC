import 'package:get/get.dart';
import 'package:getx_app/model/orang.dart';

class OrangController extends GetxController {
  var orang = Orang(nama: "Test", umur: 29).obs;
  var angka = 2.obs; //3
  var iniString = "nama".obs;

  void changeAngka(){ //method
    angka.value = 3;
  }
  void changeName(){
    orang.update((_) {
      orang.value.nama = "test3";
    });
  }

  void upperCase(){
    orang.update((_) {
      orang.value.nama = orang.value.nama.toString().toUpperCase();
    });
    
  }
}