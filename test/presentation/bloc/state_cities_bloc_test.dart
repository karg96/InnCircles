import 'package:bloc_test/bloc_test.dart';
import 'package:dummy/data/model/state_city_model.dart';
import 'package:dummy/domain/usecases/fetch_state_cities.dart';
import 'package:dummy/presentation/bloc/bloc_event.dart';
import 'package:dummy/presentation/bloc/bloc_state.dart';
import 'package:dummy/presentation/bloc/state_cities_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockFetchStateCitiesUseCase mockUseCase;
  late StateCitiesBloc bloc;
  setUp(() {
    mockUseCase = MockFetchStateCitiesUseCase();
    bloc = StateCitiesBloc(mockUseCase);
  });

  const list = <StateCity>[
    StateCity(state: "ABCD", cities: ["jhg", "hgjgh"])
  ];

  const errorMsg = "Error Fetching Data";

  test('initial state should be empty', () {
    expect(bloc.state, EmptyState());
  });

  blocTest<StateCitiesBloc, BlocState>(
      "should emit [LoadingState, SuccessState] when data is gotten successfully",
      build: () {
        when(mockUseCase.execute()).thenAnswer((_) async => Future.value(list));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchData()),
      wait: const Duration(milliseconds: 500),
      expect: () => [LoadingState(), const SuccessState(list)]);

  blocTest<StateCitiesBloc, BlocState>(
      "should emit ErrorState when list is empty",
      build: () {
        when(mockUseCase.execute()).thenAnswer((_) async => Future.value([]));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchData()),
      wait: const Duration(milliseconds: 500),
      expect: () => [LoadingState(), const ErrorState(errorMsg)]);
}
