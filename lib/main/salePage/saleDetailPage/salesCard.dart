import 'package:flutter/material.dart';

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
                          getListIcon(Icons.insert_chart,'热销'),
                          getListIcon(Icons.fiber_new,'新上'),
                          getListIcon(Icons.access_time,'待售'),
                          getListIcon(Icons.access_alarm,'已售'),
                          getListIcon(Icons.backspace,'退货'),
                        ]
                    )
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        getListIcon(Icons.insert_chart,'热销'),
                        getListIcon(Icons.fiber_new,'新上'),
                        getListIcon(Icons.access_time,'待售'),
                        getListIcon(Icons.access_alarm,'已售'),
                        getListIcon(Icons.access_alarm,'退货'),
                      ]
                  ),
                )

              ],
            )
        )
      ),
    );
  }
  getListIcon(IconData icon,String text){
   return Column(
       children: <Widget>[
         CircleAvatar(
             backgroundColor: Colors.blue,
             radius: 20.0,
             child: Icon(icon,size:20)
         ),
         Text(text)
       ]
   );
  }
}