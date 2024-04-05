import 'package:dummy/data/model/state_city_model.dart';
import 'package:dummy/domain/repository/state_cities_repository.dart';

class FetchStateCitiesUseCase{
  final StateCitiesRepository stateCitiesRepository;

  FetchStateCitiesUseCase(this.stateCitiesRepository);

  Future<List<StateCity>> execute(){
    return stateCitiesRepository.getStateCities();
  }
}