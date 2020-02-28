import 'package:flutter/material.dart';
///
/// 全畫面共用上下tabbar
/// Date: 2020-02-14
///
class MyScaffoldWidget extends StatefulWidget {
   final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Widget appBarActions;

  final Color backgroundColor;

  final Color indicatorColor;

  final Widget title;

  final Widget floatingActionButton;

  final PageController topPageControl;

  final ValueChanged<int> onPageChanged;

  final Widget bottomNavBarChild;

  final Widget getBody;

  final Widget drawer;

  final List<Widget> actions;
  
  MyScaffoldWidget({
    Key key,
    this.type,
    this.tabItems,
    this.tabViews,
    this.appBarActions,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.floatingActionButton,
    this.topPageControl,
    this.onPageChanged,
    this.bottomNavBarChild,
    this.getBody,
    this.drawer,
    this.actions
  }) : super(key: key);

  @override
  _MyScaffoldWidgetState createState() => new _MyScaffoldWidgetState(
    drawer,
  );
}

class _MyScaffoldWidgetState extends State<MyScaffoldWidget> {

  

  final Widget _drawer;

  _MyScaffoldWidgetState(
    
    this._drawer,
  ) : super();



  @override
  void initState() {
    super.initState();
    
  }

  ///整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer,
      appBar: AppBar(
        backgroundColor: widget.backgroundColor,
        elevation: 0,
        title: widget.title,
        centerTitle: true,
        actions: widget.actions,
        
      ),
      body: widget.getBody,
      bottomNavigationBar: widget.bottomNavBarChild,
    );
  }
}