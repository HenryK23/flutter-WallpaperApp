import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/screen/wallpaper_set_screen.dart';

import '../providers/photo_provider.dart';

class ImageGrid extends StatefulWidget {
  const ImageGrid({Key? key}) : super(key: key);

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  @override
  initState() {
    Provider.of<Photo>(context, listen: false).fetchCuratedPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Photo>(
      builder: (ctx, photoData, _) => 
     
      SizedBox(
        height: 520,
        child: GridView.builder(
          itemCount: photoData.photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 6,
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.69),
          itemBuilder: (_, i) => GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, SetWallpaperScreen.routeName,
                arguments: {"photoData": photoData.photos[i]}),
            child: GridTile(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(photoData.photos[i].smallUrl))),
          ),
        ),
      ),
    );
  }
}
