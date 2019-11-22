import 'dart:io';
import 'dart:convert';
import 'package:flutter_shiniu/common/mock/mockdata/hotSaleListData.dart' as HotSaleListData;
import 'package:flutter_shiniu/common/mock/mockdata/newProductData.dart' as NewProductData;
import 'package:flutter_shiniu/common/mock/mockdata/waitSaleData.dart' as WaitSaleData;
import 'package:flutter_shiniu/common/mock/mockdata/haveSaleData.dart' as HaveSaleData;
import 'package:flutter_shiniu/common/mock/mockdata/returnProductData.dart' as ReturnProductData;




import 'package:mock_web_server/mock_web_server.dart';
class MockServer{
  var server = new MockWebServer(port:8089);

  startWebServer() {
    server.start();
    //请求转发
    var dispatcher = (HttpRequest request) async{
      //热销列表榜单
     /* if (request.uri.path == "/hostSaleListData") {
        return mockHotSaleListData();
      } else if (request.uri.path == "/newProduct") {
        return mockNewProductData();
      }
      return new MockResponse()..httpCode = 404;
      */
      switch(request.uri.path){
        //热销
        case "/hostSaleListData": return mockHotSaleListData();
        //新上
        case "/newProduct": return mockNewProductData();
        //待售
        case "/waitSale" : return mockWaitSaleData();
        //已售
        case "/haveSale" : return mockHaveSaleData();
        //退货
        case "/returnProduct": return mockReturnProductData();


        default : return new MockResponse()..httpCode = 404;
      }
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
  Future<MockResponse> mockWaitSaleData() async{
    return new MockResponse()
      ..httpCode = 200
      ..body = json.encode(WaitSaleData.data);
  }
  Future<MockResponse> mockHaveSaleData() async{
    return new MockResponse()
      ..httpCode = 200
      ..body = json.encode(HaveSaleData.data);
  }
  Future<MockResponse> mockReturnProductData() async{
    return new MockResponse()
      ..httpCode = 200
      ..body = json.encode(ReturnProductData.list);
  }

  closeWebServer(){
    server.shutdown();
  }
}