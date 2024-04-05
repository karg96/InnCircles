import 'package:dummy/data/datasource/json_data_source.dart';
import 'package:dummy/domain/repository/state_cities_repository.dart';
import 'package:dummy/domain/usecases/fetch_state_cities.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  StateCitiesRepository,
  JsonDataSource,
  FetchStateCitiesUseCase
])

void main(){}