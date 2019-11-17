import 'package:flutter/material.dart';
import 'package:flutter_shiniu/main/logisticsPage/logisticsPage.dart';
import 'package:flutter_shiniu/main/organizePage/organizePage.dart';
import 'package:flutter_shiniu/main/producePage/producePage.dart';
import 'package:flutter_shiniu/main/salePage/salePage.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage>{
  int _currentIndex = 0;
  Widget mainWidget ;
  List<Widget> list = [SalePage(),ProducePage(),OrganizePage(),LogisticsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: mainWidget,
        bottomNavigationBar : BottomNavigationBar(
          backgroundColor: Colors.white70,
          items : [
            BottomNavigationBarItem(
              icon : Icon(
                Icons.home,
                color: Colors.blue
              ),
              title : Text(
                '销售',
                style : TextStyle(color: Colors.black)
              )
            ),
           BottomNavigationBarItem(
                icon : Icon(
                    Icons.airplay,
                    color: Colors.blue
                ),
                title : Text(
                    '生产',
                    style : TextStyle(color: Colors.black)
                )
            ),
            BottomNavigationBarItem(
                icon : Icon(
                    Icons.add_to_queue,
                    color: Colors.blue
                ),
                title : Text(
                    '后勤',
                    style : TextStyle(color: Colors.black)
                )
            ), BottomNavigationBarItem(
                icon : Icon(
                    Icons.group,
                    color: Colors.blue
                ),
                title : Text(
                    '组织',
                    style : TextStyle(color: Colors.black)
                )
            )

          ],
          type: BottomNavigationBarType.fixed,
          currentIndex:_currentIndex,
          onTap:(int index){
            setState((){
              _currentIndex = index;
              mainWidget = list[_currentIndex];
            });
          }
        ),
    );
  }

}