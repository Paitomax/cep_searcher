import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cep_searcher/src/models/cep_response.dart';
import 'package:cep_searcher/src/providers/cep_provider.dart';
import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CepProvider cepProvider;

  HomeBloc(this.cepProvider);

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is SearchCepHomeEvent) {
      String cep = event.cep;
      if (cep.length == 9) {
        yield LoadingHomeState();
        try {
          CepResponse response = await cepProvider.getCep(cep);
          if (response.status != 200)
            yield NotFoundHomeState(cep);
          else
            yield LoadedHomeState(response);
        } catch (error) {
          yield ErrorHomeState(error);
        }
      } else {
        yield InvalidHomeState();
      }
    }
  }
}
