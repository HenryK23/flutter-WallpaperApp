import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/photo_provider.dart';
import 'category_item.dart';

class Categories extends StatelessWidget {
  Categories({
    Key? key,
  }) : super(key: key);

  List<Map<String, String>> categories = [
    {
      "category": "Daily",
      "url":
          "https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg?auto=compress&cs=tinysrgb&h=130"
    },
    {
      "category": "Nature",
      "url":
          "https://images.pexels.com/photos/3408744/pexels-photo-3408744.jpeg?auto=compress&cs=tinysrgb&h=130"
    },
    {
      "category": "City",
      "url":
          "https://images.pexels.com/photos/374870/pexels-photo-374870.jpeg?auto=compress&cs=tinysrgb&h=130"
    },
    {
      "category": "Street Art",
      "url":
          "https://images.pexels.com/photos/162379/lost-places-pforphoto-leave-factory-162379.jpeg?auto=compress&cs=tinysrgb&h=130"
    },
    {
      "category": "Wild Life",
      "url":
          "https://images.pexels.com/photos/16066/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=130"
    },
    {
      "category": "Cute",
      "url":
          "https://images.pexels.com/photos/1767434/pexels-photo-1767434.jpeg?auto=compress&cs=tinysrgb&h=130"
    },
    {
      "category": "Dark",
      "url":
          "https://images.pexels.com/photos/2449600/pexels-photo-2449600.png?auto=compress&cs=tinysrgb&h=130"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(
                src: categories[index]["url"]!,
                category: categories[index]["category"]!);
          },
        ),
      ),
    );
  }
}
