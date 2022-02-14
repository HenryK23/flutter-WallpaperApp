import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:wallpaperapp/components/colors_widget.dart';
import 'package:wallpaperapp/providers/photo_provider.dart';

import '../components/categories_widget.dart';
import '../components/image_grid_widget.dart';
import '../components/logo_widget.dart';
import '../components/search_bar_widget.dart';
import '../models/photo_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height + 100,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(children: [
            const Logo(),
            const SearchBar(),
            const SizedBox(
              height: 10,
            ),
            Categories(),
            Colours(),
            const ImageGrid()
          ]),
        ),
      ),
    );
  }
}
