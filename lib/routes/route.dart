import 'package:get/get.dart';
import 'package:yaduzfashion/HomePage/View/Home.dart';
import 'package:yaduzfashion/pages/login.dart';

class Routes{
  static List<GetPage<dynamic>> route = [
    GetPage(name: "/", page: () => Login()),
    GetPage(name: "/", page: () => Home()),
  ];
}