import 'package:equatable/equatable.dart';

import '../../data/model/state_city_model.dart';

abstract class BlocState extends Equatable {
  const BlocState();
  @override
  List<Object?> get props => [];
}

class EmptyState extends BlocState {}

class LoadingState extends BlocState {}

class SuccessState extends BlocState {
  final List<StateCity> stateCitiesList;

  const SuccessState(this.stateCitiesList);

  @override
  List<Object?> get props => [stateCitiesList];
}

class ErrorState extends BlocState {
  final String msg;

  const ErrorState(this.msg);

  @override
  List<Object?> get props => [msg];
}
