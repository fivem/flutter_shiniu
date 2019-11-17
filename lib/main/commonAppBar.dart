import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  CommonAppBar({Key key,this.title, this.icon }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  State<StatefulWidget> createState() {
    return _CommonAppBar();
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);


}

class _CommonAppBar extends State<CommonAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new Text(widget.title),
      leading: new Icon(widget.icon),
      backgroundColor: Colors.blue,
      centerTitle: true,
      actions: <Widget>[
        // 非隐藏的菜单
        new IconButton(
            icon: new Icon(Icons.add_alarm),
            tooltip: 'Add Alarm',
            onPressed: () {}
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