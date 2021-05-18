import 'package:dolaNow/repository/request.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySplashHome(),

      //routes: {
      //'/dolar': (context) => Dolar(),
      //'/euro': (context) => Euro(),
      //'/moedas': (context) => Moedas(),
      //},
    ),
  );
}

class MySplashHome extends StatefulWidget {
  @override
  _MySplashHomeState createState() => _MySplashHomeState();
}

class _MySplashHomeState extends State<MySplashHome> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        routeName: '/',
        navigateAfterSeconds: new HomePage(),
        title: new Text(
          'Bem Vindo ao Dola',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: 'Jaapokki'),
        ),
        image: new Image.asset(
          'assets/Title.png',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        backgroundColor: Color(0xff222831),
        photoSize: 80.0,
        loaderColor: Color(0xff00adb5));
  }
}
