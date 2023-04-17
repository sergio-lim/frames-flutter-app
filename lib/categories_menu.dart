import 'package:flutter/material.dart';
import 'package:walls/categories_screens/life.dart';
import 'package:walls/main_menu.dart';
import 'categories_screens/oled.dart';
import 'package:walls/categories_screens/shapes.dart';
import 'categories_screens/gradient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Wallpapers extends StatefulWidget {
  const Wallpapers({Key? key}) : super(key: key);
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<Wallpapers> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _see = (prefs.getBool('see') ?? false);

    if (_see == false) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainMenu(),
          ));
      await prefs.setBool('see', true);
    } else {
      builder:
      (context) => Wallpapers();
    }
  }

  @override
  Widget build(BuildContext context) {
    checkFirstSeen();

    return Container(
        child: ListView(
      children: [
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/categories/shapes.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: TextButton(
              child: Text(
                'SHAPES',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShapesScreen(),
                    ));
              },
              style: TextButton.styleFrom(primary: Colors.grey),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/categories/blurred.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: TextButton(
              child: Text(
                'BLURRED',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GradientScreen(),
                    ));
              },
              style: TextButton.styleFrom(primary: Colors.grey),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/categories/amoled.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: TextButton(
              child: Text(
                'OLED',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AmoledScreen(),
                    ));
              },
              style: TextButton.styleFrom(primary: Colors.grey),
            ),
          ),
        ),
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/categories/life.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: TextButton(
              child: Text(
                'LIFE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LifeScreen(),
                    ));
              },
              style: TextButton.styleFrom(primary: Colors.grey),
            ),
          ),
        ),
      ],
    ));
  }
}
