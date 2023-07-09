import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jokes_app/models/jokes_model.dart';


class ApiServices {
  static const baseUrlUniversityInfo =
      'https://official-joke-api.appspot.com/random_ten';

  Future<List<JokesModel>?> getJokes() async {
    try {
      Uri url = Uri.parse(baseUrlUniversityInfo);
      http.Response response = await http.get(url);
      debugPrint('Response Status: ${response.statusCode}');
      final List body = jsonDecode(response.body);
      debugPrint("$body");

      if (response.statusCode == 200) {
        List<JokesModel> jokesData =
        body.map((e) => JokesModel.fromJson(e)).toList();
        return jokesData;
      } else {
        debugPrint('ERROR: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}