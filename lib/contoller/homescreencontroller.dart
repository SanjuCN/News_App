import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';
import 'package:newsapp1/model/model.dart';

class homescreenprovider with ChangeNotifier{
   bool is_loading = false;
  bool iscategoryloading = false;
  Newsapi? datamodel;
  Fetchnews({String searchQuery = "trending"}) async {
    is_loading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchQuery&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decodedData = jsonDecode(response.body);

    datamodel = Newsapi.fromJson(decodedData);
    is_loading = false;
    notifyListeners();
  }


  fetchCategorySports({String category = "sports"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Newsapi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }

  fetchCategoryHealth({String category = "Health"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Newsapi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }

  fetchCategoryTechnology({String category = "Technology"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Newsapi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }

  fetchCategoryBussines({String category = "Bussiness"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Newsapi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }

   fetchCategoryScience({String category = "Science"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Newsapi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();
  }

  fetchCategoryGeneral({String category = "General"}) async {
    iscategoryloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=171c6e369bdf4b229dc8c92bb3a87f4c");
    final response = await http.get(url);
    var decpdedData = jsonDecode(response.body);
    datamodel = Newsapi.fromJson(decpdedData);
    iscategoryloading = false;
    notifyListeners();}


}