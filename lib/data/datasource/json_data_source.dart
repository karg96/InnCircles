import 'dart:convert';

import 'package:dummy/data/model/state_city_model.dart';
import 'package:flutter/services.dart';

abstract class JsonDataSource {
  Future<List<StateCity>> getStateCities();
}

class JsonDataSourceImpl extends JsonDataSource {
  @override
  Future<List<StateCity>> getStateCities() async {
    try {
      String jsonString = await rootBundle.loadString('assets/dummy.json');
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<StateCity> stateCities =
          jsonList.map((json) => StateCity.fromJson(json)).toList();
      return stateCities;
    } catch (e) {
      return [];
    }
  }
}
