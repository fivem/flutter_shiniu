import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/extension.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/feedBack.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/haveSale.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/hotSale.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/marketing.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/newProduct.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/promotion.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/returnProduct.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/survey.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/productSales/waitSale.dart';

class SalesCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Padding(
        padding: EdgeInsets.all(10),
        child:Card(
            elevation: 15.0,  //设置阴影
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child:SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0,10.0,0,10),
                      child: Text('产品销售'),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          getListIcon(context,Icons.insert_chart,'热销','hotSale'),
                          getListIcon(context,Icons.fiber_new,'新上','newProduct'),
                          getListIcon(context,Icons.access_time,'待售','waitSale'),
                          getListIcon(context,Icons.access_alarm,'已售','haveSale'),
                          getListIcon(context,Icons.access_alarm,'退货','returnProduct'),
                        ]
                    )
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        getListIcon(context,Icons.insert_chart,'推广','extension'),
                        getListIcon(context,Icons.fiber_new,'营销','marketing'),
                        getListIcon(context,Icons.access_time,'促销','promotion'),
                        getListIcon(context,Icons.access_alarm,'调研','survey'),
                        getListIcon(context,Icons.access_alarm,'反馈','feedBack'),
                      ]
                  ),
                )
              ],
            )
        )
      ),
    );
  }
  getListIcon(BuildContext context,IconData icon,String text,String target){
    _handleTap(){
      print("target:"+target);
      var tempTarget = getTargetPage(target);
      if(tempTarget != null){
        Navigator.of(context).push(MaterialPageRoute(builder:(_){
          return tempTarget;
        })
        );
      }
    }
    return Column(
       children: <Widget>[
         GestureDetector(
           onTap:_handleTap,
           child:CircleAvatar(
               backgroundColor: Colors.blue,
               radius: 20.0,
               child: Icon(icon,size:20)
           )
         ),
         Text(text)
       ]
    );
  }

  getTargetPage(String target){
    switch(target){
      case 'hotSale': return HotSale();
      case 'newProduct': return NewProduct();
      case 'waitSale': return WaitSale();
      case 'haveSale': return HaveSale();
      case 'returnProduct': return ReturnProduct();
      case 'extension': return Extension();
      case 'marketing': return Marketing();
      case 'promotion': return Promotion();
      case 'survey': return Survey();
      case 'feedBack': return FeedBack();
      default: null;
    }
  }
}