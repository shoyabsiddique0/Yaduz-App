import 'package:get/get.dart';

class SignUpController extends GetxController{
  var obsVal = RxBool(true);
  var chkVal = RxBool(false);
  void updateObs(){
    obsVal.value = ! obsVal.value;
  }
  void updateChk(val){
    chkVal.value = val;
  }
}