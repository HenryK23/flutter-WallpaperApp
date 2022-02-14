import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/providers/photo_provider.dart';

class ColourItem extends StatelessWidget {
  ColourItem({
    Key? key,
    required this.colourData,
    required this.colour,
  }) : super(key: key);

  Color colourData;
  String colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Provider.of<Photo>(context, listen: false).fetchColourPhotos(colour),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: SizedBox(
            width: 110,
            height: 75,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: colourData,
                        )),
                  ),
                  Center(
                      child: Text(colour,
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
