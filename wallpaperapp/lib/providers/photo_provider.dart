import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/models/photo_model.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Photo with ChangeNotifier {
  List<PhotoModel> _photos = [];

  String _lastQuery = "Random";
  String _lastColor = "Yellow";
  int catIndex = 1;
  int colIndex = 1;

  List<PhotoModel> get photos {
    return [..._photos];
  }

  String apiKey = dotenv.env["API_KEY"]!;

  Future<void> fetchCuratedPhotos() async {
    List<PhotoModel> loadedPhotos = [];
    final url =
        Uri.parse("https://api.pexels.com/v1/curated?page=1&per_page=20");
    Map<String, String> requestHeaders = {'Authorization': apiKey};

    try {
      var response = await http.get(url, headers: requestHeaders);

      Map<String, dynamic> extractedData = json.decode(response.body);

      for (int x = 0; x < extractedData["photos"].length; x++) {
        loadedPhotos.add(PhotoModel(
            id: extractedData["photos"][x]["id"],
            bigUrl: extractedData["photos"][x]["src"]["original"],
            smallUrl: extractedData["photos"][x]["src"]["portrait"],
            photographer: extractedData["photos"][x]["photographer"]));

        _photos = loadedPhotos;

        notifyListeners();
      }
    } catch (error) {
      _photos = loadedPhotos;
      notifyListeners();
    }
  }

  Future<void> fetchCategoryPhotos(String category) async {
    List<PhotoModel> loadedPhotos = [];

    Map<String, String> requestHeaders = {'Authorization': apiKey};
    var url;

    try {
      if (category == "Daily") {
        url = Uri.parse("https://api.pexels.com/v1/curated?page=1&per_page=20");
      } else if (category == _lastQuery) {
        catIndex++;
        colIndex = 1;
        url = Uri.parse(
            "https://api.pexels.com/v1/search?query=$category&page=$catIndex&per_page=20");
      } else {
        catIndex = 0;
        url = Uri.parse(
            "https://api.pexels.com/v1/search?query=$category&page=$catIndex&per_page=20");
      }

      var response = await http.get(url, headers: requestHeaders);

      Map<String, dynamic> extractedData = json.decode(response.body);

      for (int x = 0; x < extractedData["photos"].length; x++) {
        loadedPhotos.add(PhotoModel(
            id: extractedData["photos"][x]["id"],
            bigUrl: extractedData["photos"][x]["src"]["original"],
            smallUrl: extractedData["photos"][x]["src"]["portrait"],
            photographer: extractedData["photos"][x]["photographer"]));

        _photos = loadedPhotos;
        _lastQuery = category;

        notifyListeners();
      }
    } catch (error) {
      _photos = loadedPhotos;
      notifyListeners();
    }
  }

  Future<void> fetchColourPhotos(String colour) async {
    List<PhotoModel> loadedPhotos = [];
    Map<String, String> requestHeaders = {'Authorization': apiKey};

    try {
      if (colour == _lastColor) {
        colIndex++;
        catIndex = 0;
      } else {
        colIndex = 1;
      }

      final url = Uri.parse(
          "https://api.pexels.com/v1/search?query=$_lastQuery&color=$colour&page=$colIndex&per_page=20");

      var response = await http.get(url, headers: requestHeaders);

      Map<String, dynamic> extractedData = json.decode(response.body);

      for (int x = 0; x < extractedData["photos"].length; x++) {
        loadedPhotos.add(PhotoModel(
            id: extractedData["photos"][x]["id"],
            bigUrl: extractedData["photos"][x]["src"]["original"],
            smallUrl: extractedData["photos"][x]["src"]["portrait"],
            photographer: extractedData["photos"][x]["photographer"]));

        _photos = loadedPhotos;
        _lastColor = colour;

        notifyListeners();
      }
    } catch (error) {
      _photos = loadedPhotos;
      notifyListeners();
    }
  }

  // Future<String?> fetchPhotoByCategory(String category) async {
  //   final url = Uri.parse(
  //       "https://api.pexels.com/v1/search?query=$category&per_page=5");
  //   Map<String, String> requestHeaders = {'Authorization': apiKey};

  //   try {
  //     var response = await http.get(url, headers: requestHeaders);

  //     Map<String, dynamic> extractedData = json.decode(response.body);
  //     print(extractedData["photos"][1]["src"]["small"]);
  //     return (extractedData["photos"][1]["src"]["small"]);
  //   } catch (error) {
  //     return null;
  //   }
  // }
}
