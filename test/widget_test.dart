import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:restourant/utils/url.dart';

void main() {
  test('Test API', () async {
    List<dynamic> listData = [];

    final dataRestaurant = await http.get(Uri.parse(BashUrl.urlJson));

    Map<String, dynamic> parseJson = jsonDecode(dataRestaurant.body);

    List<dynamic> result = parseJson['restaurants'];

    for (var element in result) {
      listData.add(element);
    }

    return listData;
  });
}
