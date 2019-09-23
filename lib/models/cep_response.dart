import 'package:json_annotation/json_annotation.dart';

part 'cep_response.g.dart';

@JsonSerializable()
class CepResponse {
  int status;
  String message;
  String code;
  String state;
  String city;
  String district;
  String address;

  CepResponse({this.status,
      this.message,
      this.code,
      this.state,
      this.city,
      this.district,
      this.address});

  factory CepResponse.fromJson(Map<String, dynamic> json) =>
      _$CepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CepResponseToJson(this);
}
