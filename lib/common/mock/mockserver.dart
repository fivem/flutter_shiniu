import 'package:mock_web_server/mock_web_server.dart';
class MockServer{
  var server = new MockWebServer();

  startMockServer(){
    server.start();
  }

  hotSaleListData(){
    List list=[{
      "id":4,
      "name":"",
      "account":"",
    },{
      "id":5,
      "name":"",
      "account":"",
    },{
      "id":6,
      "name":"",
      "account":"",
    },{
      "id":7,
      "name":"",
      "account":"",
    },{
      "id":8,
      "name":"",
      "account":"",
    },{
      "id":9,
      "name":"",
      "account":"",
    },{  "id":10,
      "name":"",
      "account":"",
    }];
    server.enqueue(body:list,httpCode: 200);
    var mockResponse = new MockResponse()
      ..httpCode = 200
      ..body = list;
    //TODO
    //server.takeRequest()
    server.enqueueResponse(mockResponse);

  }


}