import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper(
      {Key? key,
      required this.wall,
      required this.wall_url,
      required this.wall_id})
      : super(key: key);
  final String wall;
  final String wall_url;
  final String wall_id;

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(5, 5),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.grey.shade800,
                      offset: Offset(-4, -4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ]),
              child: Image.asset(widget.wall),
            ),
            Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade800,
                        offset: Offset(-2, -2),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ]),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 0.0,
                        color: Colors.transparent,
                        style: BorderStyle.solid,
                      ),
                    ),
                    onPressed: () async {
                      Image_Downloader(widget.wall);
                    },
                    child: Icon(
                      Icons.download_rounded,
                      color: Colors.lightGreenAccent,
                      size: 30,
                    ))),
          ],
        ),
      ),
    );
  }

  Image_Downloader(String wall) async {
    try {
      var imageId = await ImageDownloader.downloadImage(
        widget.wall_url,
        destination: AndroidDestinationType.directoryDownloads
          ..subDirectory(widget.wall_id),
      );
      if (imageId == null) {
        print('image != null');
        return;
      }
      var filename = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
}
