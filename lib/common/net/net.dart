import 'package:dio/dio.dart';
import 'package:flutter_shiniu/common/mock/mockserver.dart';
import 'dart:convert';

class Net{
  Dio dio = new Dio();
  MockServer mockServer = new MockServer();
  final String BASE_URL='http://127.0.0.1:8089';
  get(String url,{Map<String, dynamic> queryParameters}) async{
    mockServer.startWebServer();
    Response response = await dio.get(BASE_URL+url,queryParameters:queryParameters);
    var result = json.decode(response.data);
    mockServer.closeWebServer();
    return result;
  }
}

void main() async{
  Dio dio = new Dio();
 // MockServer mockServer = new MockServer();
 // mockServer.startWebServer();
  //Response result = await dio.get("http://127.0.0.1:8089/hostSaleListData",queryParameters: {});
  var result = await Net().get("/hostSaleListData");
  print(result);
 /* String data = result.data;
  print("set :"+data);
  var user = json.decode(data);
  print(user[0]['id']);*/
 // mockServer.closeWebServer();
}