import 'package:dummy/data/model/state_city_model.dart';

abstract class StateCitiesRepository {
  Future<List<StateCity>> getStateCities();
}