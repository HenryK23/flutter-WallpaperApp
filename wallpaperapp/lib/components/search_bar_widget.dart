import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/providers/photo_provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 45,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.amber,
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Center(
            child: TextField(
              onSubmitted: (value) => Provider.of<Photo>(context, listen: false)
                  .fetchCategoryPhotos(value),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for something',
                  hintStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
