import 'package:dummy/presentation/bloc/bloc_event.dart';
import 'package:dummy/presentation/bloc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/fetch_state_cities.dart';

class StateCitiesBloc extends Bloc<BlocEvent, BlocState> {
  final FetchStateCitiesUseCase _fetchStateCitiesUseCase;

  StateCitiesBloc(this._fetchStateCitiesUseCase) : super(EmptyState()) {
    on<FetchData>((event, emit) async {
      emit(LoadingState());
      final result = await _fetchStateCitiesUseCase.execute();
      if (result.isEmpty) {
        emit(const ErrorState("Error Fetching Data"));
      } else {
        emit(SuccessState(result));
      }
    });
  }
}
