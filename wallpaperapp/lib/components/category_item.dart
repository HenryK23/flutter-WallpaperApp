import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/providers/photo_provider.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    Key? key,
    required this.src,
    required this.category,
  }) : super(key: key);

  final String src;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<Photo>(context, listen: false)
          .fetchCategoryPhotos(category),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: SizedBox(
            width: 110,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          src,
                        )),
                  ),
                  Center(
                      child: Text(category,
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          )),
    );
  }
}
