import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yaduzfashion/HomePage/View/Home.dart';
import 'package:yaduzfashion/firebase_options.dart';
import 'package:yaduzfashion/pages/login.dart';
import 'package:yaduzfashion/routes/route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  Future<void> backgroundHandler(RemoteMessage message)async {
    print(message.toString());
    print(message.notification?.title);
  }
  FirebaseMessaging.onBackgroundMessage((backgroundHandler));
  runApp(GetMaterialApp(
    onInit: (){
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if(message != null){
          print("App Started");
          print("New Notification");
          print(message.data);
        }
      });
      FirebaseMessaging.onMessage.listen((event) {
        print(event);
        if(event.notification != null){
          print("App opened in foreground");
          print(event.notification?.title);
          print(event.notification?.body);
          print(event.data);
        }
      });
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        if(event.notification != null){
          print("App opened in backdground closed from foreground");
          print(event.notification?.title);
          print(event.notification?.body);
          print(event.data);
        }
      });
    },
    home: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot){
        if(snapshot.hasData){
          return Home();
        }
        else if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        return Login();
      },
    ),
    getPages: Routes.route,
  ));
}
