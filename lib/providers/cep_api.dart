import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/cep_response.dart';

part 'cep_api.g.dart';

@RestApi(baseUrl: "http://apps.widenet.com.br/busca-cep/api/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/cep/{cep}.json")
  Future<CepResponse> getCep(@Path() String cep);
}
