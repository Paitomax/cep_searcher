import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SearchCepHomeEvent extends Equatable {
  final String cep;

  SearchCepHomeEvent(this.cep);

  @override
  List<Object> get props => [cep];
}
