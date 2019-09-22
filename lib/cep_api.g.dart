// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CepResponse _$CepResponseFromJson(Map<String, dynamic> json) {
  return CepResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    code: json['code'] as String,
    state: json['state'] as String,
    city: json['city'] as String,
    district: json['district'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$CepResponseToJson(CepResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'state': instance.state,
      'city': instance.city,
      'district': instance.district,
      'address': instance.address,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  final String baseUrl = 'http://apps.widenet.com.br/busca-cep/api/';

  @override
  getCep(cep) async {
    ArgumentError.checkNotNull(cep, 'cep');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/cep/$cep.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CepResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
