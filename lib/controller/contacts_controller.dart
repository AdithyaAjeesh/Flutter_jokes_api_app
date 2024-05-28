import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mock_api_app/model/charachter_model.dart';

class ContactsController extends ChangeNotifier {
  Dio dio = Dio();
  
  CharachterModel? charachterModel;

  Future<CharachterModel> fetchData() async {
    final response = await dio.get(
      'https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          'X-RapidAPI-Key':
              '8db3323368msh9881e07e590390ap12fca4jsnbda19fbbfe96',
          'X-RapidAPI-Host': 'matchilling-chuck-norris-jokes-v1.p.rapidapi.com',
        },
      ),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      log('Success');
      Map<String, dynamic> jsonData = response.data;
      charachterModel = CharachterModel.fromJson(jsonData);
      return charachterModel!;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
