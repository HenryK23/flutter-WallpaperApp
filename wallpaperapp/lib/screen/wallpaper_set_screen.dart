import 'package:flutter/material.dart';
import 'package:wallpaperapp/models/photo_model.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class SetWallpaperScreen extends StatefulWidget {
  static const String routeName = "/setWallpaper";

  const SetWallpaperScreen({Key? key}) : super(key: key);

  @override
  State<SetWallpaperScreen> createState() => _SetWallpaperScreenState();
}

class _SetWallpaperScreenState extends State<SetWallpaperScreen> {
  void setWallpaper(String src) async {
    var file = await DefaultCacheManager().getSingleFile(src);
    try {
      int location = WallpaperManager.BOTH_SCREEN;
      await WallpaperManager.setWallpaperFromFile(file.path, location);
    } catch (error) {}
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, PhotoModel>;
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(args["photoData"]?.smallUrl)),
        ),
        Container(
            padding: const EdgeInsets.only(bottom: 50),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                onPressed: () {
                  setWallpaper(args["photoData"]?.bigUrl);
                },
                child: const Text(
                  "Set Wallpaper",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ))),
        Container(
          alignment: Alignment.bottomCenter,
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text("Photographed By " + args["photoData"]?.photographer),
          )),
        )
      ],
    );
  }
}
