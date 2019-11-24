import 'dart:io';
import 'dart:convert';
import 'package:flutter_shiniu/common/mock/mockdata/hotSaleListData.dart' as HotSaleListData;
import 'package:flutter_shiniu/common/mock/mockdata/newProductData.dart' as NewProductData;
import 'package:flutter_shiniu/common/mock/mockdata/waitSaleData.dart' as WaitSaleData;
import 'package:flutter_shiniu/common/mock/mockdata/haveSaleData.dart' as HaveSaleData;
import 'package:flutter_shiniu/common/mock/mockdata/returnProductData.dart' as ReturnProductData;
import 'package:flutter_shiniu/common/mock/mockdata/feedBackData.dart' as FeedBackData;
import 'package:flutter_shiniu/common/mock/mockdata/extensionData.dart' as ExtensionData;


import 'package:mock_web_server/mock_web_server.dart';
class MockServer{
  var server = new MockWebServer(port:8089);

  startWebServer() {
    server.start();
    //请求转发
    var dispatcher = (HttpRequest request) async{
      //热销列表榜单
     /* if (request.uri.path == '/hostSaleListData') {
        return mockHotSaleListData();
      } else if (request.uri.path == '/newProduct') {
        return mockNewProductData();
      }
      return new MockResponse()..httpCode = 404;
      */
      switch(request.uri.path){
        //热销
        case '/hostSaleListData': return mockData(HotSaleListData.data);
        //新上
        case '/newProduct': return mockData(NewProductData.data);
        //待售
        case '/waitSale' : return mockData(WaitSaleData.data);
        //已售
        case '/haveSale' : return mockData(HaveSaleData.data);
        //退货
        case '/returnProduct': return mockData(ReturnProductData.data);
        //反馈
        case '/feedBack': return mockData(FeedBackData.data);
        //推广
        case '/extension': return mockData(ExtensionData.data);

        default : return new MockResponse()..httpCode = 404;
      }
    };
    server.dispatcher = dispatcher;
  }

  Future<MockResponse> mockData(var data) async{
    return new MockResponse()
      ..httpCode = 200
      ..body = json.encode(data);
  }

  closeWebServer(){
    server.shutdown();
  }
}