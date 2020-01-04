// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_provider.dart';

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
