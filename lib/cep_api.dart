import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'cep_api.g.dart';

@RestApi(baseUrl: "http://apps.widenet.com.br/busca-cep/api/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/cep/{cep}.json")
  Future<CepResponse> getCep(@Path() String cep);
}

@JsonSerializable()
class CepResponse {
  int status;
  String message;
  String code;
  String state;
  String city;
  String district;
  String address;

  CepResponse({this.status, this.message, this.code, this.state, this.city, this.district, this.address});

  factory CepResponse.fromJson(Map<String, dynamic> json) => _$CepResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CepResponseToJson(this);
}