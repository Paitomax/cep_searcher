import 'package:cep_searcher/src/models/cep_response.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedHomeState extends HomeState {
  final CepResponse cep;

  LoadedHomeState(this.cep);

  @override
  List<Object> get props => [cep];
}

class NotFoundHomeState extends HomeState {
  final String cep;

  NotFoundHomeState(this.cep);

  @override
  List<Object> get props => [cep];
}

class ErrorHomeState extends HomeState {
  final String error;

  ErrorHomeState(this.error);

  @override
  List<Object> get props => [error];
}

class InvalidHomeState extends HomeState {
  @override
  List<Object> get props => [];
}
