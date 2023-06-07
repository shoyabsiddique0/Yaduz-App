import 'package:get/get.dart';

class LoginController extends GetxController{
  var obsVal = RxBool(true);
  void updateObs(){
    obsVal.value = ! obsVal.value;
  }
}