import 'package:flutter/material.dart';

import '../../data/model/state_city_model.dart';

class CityPage extends StatelessWidget {
  final StateCity stateCity;

  const CityPage({super.key, required this.stateCity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cities in ${stateCity.state}")),
      body: ListView.builder(
          itemCount: stateCity.cities.length,
          itemBuilder: (context, index) {
            final city = stateCity.cities[index];
            return ListTile(title: Text(city));
          }),
    );
  }
}
