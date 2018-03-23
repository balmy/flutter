import 'package:flutter/material.dart';

enum TabsStyle { iconsAndText, iconsOnly, textOnly }

class _Page {
  _Page({
    this.icon,
    this.text,
  });

  final IconData icon;
  final String text;
}

final List<_Page> _allPages = <_Page>[
  new _Page(icon: Icons.event, text: 'EVENT'),
  new _Page(icon: Icons.home, text: 'HOME'),
  new _Page(icon: Icons.android, text: 'ANDROID'),
  new _Page(icon: Icons.alarm, text: 'ALARM'),
  new _Page(icon: Icons.face, text: 'FACE'),
  new _Page(icon: Icons.language, text: 'LANGUAGE'),
];

class TabTopDemo extends StatefulWidget {
  @override
  _TabTopDemoState createState() => new _TabTopDemoState();
}

class _TabTopDemoState extends State<TabTopDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TabsStyle _tabsStyle = TabsStyle.iconsAndText;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void changeDemoStyle(TabsStyle style) {
    setState(() {
      _tabsStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).accentColor;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('tab top demo'),
        actions: <Widget>[
          new PopupMenuButton<TabsStyle>(
              onSelected: changeDemoStyle,
              itemBuilder: (BuildContext context) => <PopupMenuItem<TabsStyle>>[
                    new PopupMenuItem<TabsStyle>(
                        value: TabsStyle.iconsAndText,
                        child: new Text('图标和文本')),
                    new PopupMenuItem<TabsStyle>(
                        value: TabsStyle.iconsOnly, child: new Text('仅图标')),
                    new PopupMenuItem<TabsStyle>(
                        value: TabsStyle.textOnly, child: new Text('仅文本'))
                  ]),
        ],
        bottom: new TabBar(
          // 控件的选择和动画状态
          controller: _tabController,
          // 标签栏是否可以水平滚动
          isScrollable: true,
          // 标签控件的列表
          tabs: _allPages.map((_Page page){
            switch(_tabsStyle) {
              case TabsStyle.iconsAndText:
                return new Tab(text: page.text, icon: new Icon(page.icon));
              case TabsStyle.iconsOnly:
                return new Tab(icon: new Icon(page.icon));
              case TabsStyle.textOnly:
                return new Tab(text: page.text);
            }
          }).toList(),
        ),
      ),

        body: new TabBarView(
          // 控件的选择和动画状态
          controller: _tabController,
          // 每个标签一个控件
          children: _allPages.map((_Page page) {
            return new Container(
                key: new ObjectKey(page.icon),
                padding: const EdgeInsets.all(12.0),
                // 质感设计卡片
                child:new Card(
                    child: new Center(
                        child: new Icon(
                          page.icon,
                          color: iconColor,
                          size: 128.0,
                        )
                    )
                )
            );
          }).toList(),
        )


    );
  }
}



void main() {
  runApp(new MaterialApp(
    title: 'tab demo top',
    home: new TabTopDemo(),
  ));
}
