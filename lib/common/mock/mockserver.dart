import 'dart:io';
import 'dart:convert';
import 'package:flutter_shiniu/common/mock/mockdata/hotSaleListData.dart' as HotSaleListData;
import 'package:flutter_shiniu/common/mock/mockdata/newProductData.dart' as NewProductData;


import 'package:mock_web_server/mock_web_server.dart';
class MockServer{
  var server = new MockWebServer(port:8089);

  startWebServer() {
    server.start();
    //请求转发
    var dispatcher = (HttpRequest request) async{
      //热销列表榜单
      if (request.uri.path == "/hostSaleListData") {
        return mockHotSaleListData();
      } else if (request.uri.path == "/newProduct") {
        return mockNewProductData();
      }
      return new MockResponse()..httpCode = 404;
    };
    server.dispatcher = dispatcher;
  }

  Future<MockResponse> mockHotSaleListData() async{
    return new MockResponse()
      ..httpCode = 200
      ..body = json.encode(HotSaleListData.list);
  }
  Future<MockResponse> mockNewProductData() async{
    return new MockResponse()
      ..httpCode = 200
      ..body = json.encode(NewProductData.list);
  }
  closeWebServer(){
    server.shutdown();
  }
}