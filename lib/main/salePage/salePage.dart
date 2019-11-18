import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/commonAppBar.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/customer/Guest.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/customer/fixation.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/customer/fresh.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/customer/keyAccount.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/customer/potential.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/customer/relationships.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/salesCard.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/salesPlan.dart';

class SalePage extends StatefulWidget{
  @override
  _SalePage createState() => _SalePage();

}
class _SalePage extends State<SalePage>{
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: CommonAppBar(title:'销售',icon:Icons.home),
      body: Column(
        children: <Widget>[
          SalesCard(),
          SalesPlan(),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    getCustomerElement('关键客户',Icons.account_circle,'keyAccount'),
                    getCustomerElement('潜在客户',Icons.account_box,'Potential'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    getCustomerElement('固定客户',Icons.add_circle,'Fixation'),
                    getCustomerElement('新开客户',Icons.add_circle_outline,'Fresh'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    getCustomerElement('关系维系',Icons.add_box,'Relationships'),
                    getCustomerElement('来访客户',Icons.add_to_queue,'Guest'),
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
  getCustomerElement(String title,IconData icon,String target){
    _handleCustomerTap(){
      print("customer print");
      var tempTarget = getTargetpage(target);
      if(tempTarget!=null){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:(_){
              return tempTarget;
            }
          )
        );
      }
    }
    return Container(
      padding: EdgeInsets.fromLTRB(8.0,0,8.0,10.0),
      child:  Row(
        children: <Widget>[
          GestureDetector(
            onTap: _handleCustomerTap,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.vertical(top: Radius.elliptical(14.0, 14.0),bottom: Radius.elliptical(14.0, 14.0)),//设置圆角
              ),
              child:Icon(icon,size:30,color:Colors.white)
            )
          ),
          Text(title)
        ],
      ),
    );
  }
  getTargetpage(String target){
    switch(target){
      case  'keyAccount': return KeyAccount();
      case  'Potential': return Potential();
      case  'Fixation': return Fixation();
      case  'Fresh': return Fresh();
      case  'Relationships': return Relationships();
      case  'Guest': return Guest();
      default : null;
    }
  }
}