import 'package:dummy/data/datasource/json_data_source.dart';
import 'package:dummy/data/repository/state_cities_repository_impl.dart';
import 'package:dummy/domain/repository/state_cities_repository.dart';
import 'package:dummy/domain/usecases/fetch_state_cities.dart';
import 'package:dummy/presentation/bloc/state_cities_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUpLocator() {
  //bloc
  locator.registerFactory(() => StateCitiesBloc(locator()));

  //usecase
  locator.registerLazySingleton(() => FetchStateCitiesUseCase(locator()));

  //repository
  locator.registerLazySingleton<StateCitiesRepository>(
      () => StateCitiesRepositoryImpl(jsonDataSource: locator()));

  //datasource
  locator.registerLazySingleton<JsonDataSource>(() => JsonDataSourceImpl());
}
