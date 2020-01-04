// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_response.dart';

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
