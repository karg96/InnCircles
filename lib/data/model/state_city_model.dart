class StateCity{
  final String state;
  final List<String> cities;

  const StateCity({required this.state, required this.cities});

  factory StateCity.fromJson(Map<String, dynamic> json){
    return StateCity(state: json['state'], cities: List<String>.from(json['cities']));
  }
}