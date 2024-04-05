import 'package:dummy/data/datasource/json_data_source.dart';
import 'package:dummy/data/model/state_city_model.dart';
import 'package:dummy/domain/repository/state_cities_repository.dart';

class StateCitiesRepositoryImpl extends StateCitiesRepository{
  final JsonDataSource jsonDataSource;

  StateCitiesRepositoryImpl({required this.jsonDataSource});
  @override
  Future<List<StateCity>> getStateCities() async {
    final result = await jsonDataSource.getStateCities();
    return result;
  }

}