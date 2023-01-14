import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restourant/models/drink.dart';
import 'package:restourant/models/menus.dart';
import 'package:restourant/models/restourant.dart';
import 'package:restourant/utils/url.dart';

class FetchDataRestaurant {
  Future<ListRestourant>? getListRestaurant() async {
    try {
      final dataRestaurant = await http.get(Uri.parse(BashUrl.urlJson));

      Map<String, dynamic> parseJson = jsonDecode(dataRestaurant.body);

      return ListRestourant.fromJson(parseJson);
    } on Exception catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<Restaurant> fetchDataRestaurant() async {
    try {
      final dataRestaurant = await http.get(Uri.parse(BashUrl.urlJson));
      Map<String, dynamic> parseData = jsonDecode(dataRestaurant.body);
      return Restaurant.fromJson(parseData);
    } on Exception catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<Menus> fetchMenuData() async {
    try {
      final dataMenu = await http.get(Uri.parse(BashUrl.urlJson));

      Map<String, dynamic> parseData = jsonDecode(dataMenu.body);

      return Menus.fromJson(parseData);
    } on Exception catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }

  Future<Drink> fetchDrinkData() async {
    try {
      final dataDrink = await http.get(Uri.parse(BashUrl.urlJson));

      Map<String, dynamic> parseData = jsonDecode(dataDrink.body);

      return Drink.fromJson(parseData);
    } on Exception catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }
}
