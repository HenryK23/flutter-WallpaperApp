import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/photo_provider.dart';
import 'category_item.dart';
import 'colour_item.dart';

class Colours extends StatelessWidget {
  Colours({
    Key? key,
  }) : super(key: key);

  List<Map<String, dynamic>> colours = [
    {"colour": "Red", "colourData": Colors.red},
    {"colour": "Pink", "colourData": Colors.pink},
    {"colour": "Yellow", "colourData": Colors.amber},
    {"colour": "Green", "colourData": Colors.green},
    {"colour": "Blue", "colourData": Colors.blue},
    {"colour": "Violet", "colourData": Colors.deepPurple},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colours.length,
          itemBuilder: (BuildContext context, int index) {
            return ColourItem(
                colourData: colours[index]["colourData"]!,
                colour: colours[index]["colour"]);
          },
        ),
      ),
    );
  }
}
