import 'package:flutter/material.dart';
import 'package:walls/data/blurred_data.dart';
import 'package:walls/wallpaper.dart';

class GradientScreen extends StatefulWidget {
  @override
  _GradientScreenState createState() => _GradientScreenState();
}

class _GradientScreenState extends State<GradientScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
            child: GridView.builder(
          itemCount: Data.wallpaper.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Wallpaper(
                          wall: Data.wallpaper[index].imageUrl,
                          wall_url: Data.wallpaper[index].downloadUrl,
                          wall_id: Data.wallpaper[index].id,
                        ),
                      ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(Data.wallpaper[index].imageUrl),
                ));
          },
        )),
      ),
    );
  }
}
