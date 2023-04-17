import 'package:flutter/material.dart';
import 'package:walls/categories_menu.dart';
import 'package:walls/wallpaper.dart';
import 'main_menu.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Wallpapers(),

    );
  }
}
