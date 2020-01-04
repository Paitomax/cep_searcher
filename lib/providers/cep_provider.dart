import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/cep_response.dart';

part 'cep_provider.g.dart';

@RestApi(baseUrl: "http://apps.widenet.com.br/busca-cep/api/")
abstract class CepProvider {
  factory CepProvider(Dio dio) = _RestClient;

  @GET("/cep/{cep}.json")
  Future<CepResponse> getCep(@Path() String cep);
}
