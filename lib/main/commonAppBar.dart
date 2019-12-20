import 'package:flutter/material.dart';
import 'package:flutter_shiniu/common/appbar/SearchBarDelegate.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  CommonAppBar({Key key,this.title, this.icon,this.tabBar,this.showResultWidget,this.search}) : super(key: key);
  final String title;
  final IconData icon;
  final TabBar tabBar;
  final Function showResultWidget;
  final bool search;
  @override
  State<StatefulWidget> createState() {
    return _CommonAppBar();
  }
  @override
  Size get preferredSize => Size.fromHeight(56.0+(tabBar==null?0:30.0));
}

class _CommonAppBar extends State<CommonAppBar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new Text(widget.title),
      leading: widget.icon==null?null: Icon(widget.icon),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: <Widget>[
        Visibility(
          visible: widget.search==true,
          child:new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                showSearch(context: context,delegate: SearchBarDelegate(showResultWidget:widget.showResultWidget));
              }
          ),
        ),

        // 隐藏的菜单
        new PopupMenuButton<String>(
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            this.SelectView(Icons.message, '发起群聊', 'A'),
            this.SelectView(Icons.group_add, '添加服务', 'B'),
            this.SelectView(Icons.cast_connected, '扫一扫码', 'C'),

          ],
          onSelected: (String action) {
            // 点击选项的时候
            switch (action) {
              case 'A': break;
              case 'B': break;
              case 'C': break;
            }
          },
        ),
      ],
      bottom: widget.tabBar == null ? null : widget.tabBar,
    );
  }

  SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        )
    );
  }
}