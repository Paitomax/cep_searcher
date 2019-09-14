import 'package:cep_searcher/cep_api.dart';
import 'package:dio/dio.dart';

void main(List<String> args) {
  var dio = Dio();
  RestClient api = RestClient(dio);
   var response = api.getCep("03540-000");
   response.then((it){
     print(it.address);
   }).catchError((Object obj){

   });
}
