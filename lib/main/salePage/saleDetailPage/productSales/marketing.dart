import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/net/net.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
class Marketing extends StatefulWidget {
  @override
  _MarketingState createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> {
  List listData = [];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      onTap: _tabBarOnTap,
      tabs: <Widget>[
        Tab(child:Text('辽西',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
        Tab(child:Text('辽南',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
        Tab(child:Text('辽中',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
        Tab(child:Text('辽北',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
        Tab(child:Text('辽东',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)))
      ],
    );
    return DefaultTabController(
      length: 5,
      child:Scaffold(
          appBar: CommonAppBar(title: '营销',tabBar: tabBar),
          body: TabBarView(
            children: <Widget>[
              buildTabBody(),
              buildTabBody(),
              Center(
                child: Text('产品尚未打入该地区市场'),
              ),
              buildTabBody(),
              buildTabBody()
            ],
          )
      ),
    );
  }

  _tabBarOnTap(int index) async{
    currentIndex = index;
   // var result = await Net().get('/marketting/'+index.toString());
    setState(() {
     // listData = result;
    });
  }

  buildTabBody(){
    print("current index"+currentIndex.toString());
    return Text('curent index'+currentIndex.toString());
  }

  @override
  void initState() {
    super.initState();
  }

}