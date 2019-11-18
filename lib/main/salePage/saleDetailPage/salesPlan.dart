import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/salePage/saleDetailPage/salesPlanPage/salesPlanPage.dart';
class SalesPlan extends StatefulWidget {
  @override
  _SalesPlanState createState() => _SalesPlanState();
}

class _SalesPlanState extends State<SalesPlan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0,0,8.0,15.0),
      child: Card(
        elevation: 15.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),  //设置圆角
        child: Row(
          children: <Widget>[
            Expanded(
              child:SizedBox(
                height: 90,
                child: GestureDetector(
                  onTap: _handleTap,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('销售计划',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 30.0,
                      fontWeight: FontWeight.bold,
                      )
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.vertical(top: Radius.elliptical(14.0, 14.0),bottom: Radius.elliptical(14.0, 14.0)),//设置圆角
                      image: DecorationImage(
                        image: AssetImage("assets/salesplan.jpg"),
                        fit: BoxFit.cover
                      )
                    )
                  )
                )
            )
          )
        ],
        )
      ),
    );
  }

  _handleTap(){
    print('click _SalesPalnState');
    Navigator.of(context).push(
        MaterialPageRoute(
            builder:(_){
              return SalesPlanPage();
            }
        )
    );
  }
}
