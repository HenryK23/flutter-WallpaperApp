import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:wallpaperapp/providers/photo_provider.dart';
import 'package:wallpaperapp/screen/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallpaperapp/screen/wallpaper_set_screen.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const WallpaperApp());
}

class WallpaperApp extends StatelessWidget {
  const WallpaperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Photo())],
      child: MaterialApp(
        title: "Wallpaper App",
        theme: ThemeData(
            primaryColor: Colors.black87, backgroundColor: Colors.white),
        home: HomeScreen(),
        routes: {
          SetWallpaperScreen.routeName: (context) => SetWallpaperScreen()
        },
      ),
    );
  }
}
