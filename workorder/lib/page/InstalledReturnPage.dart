import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/common/utils/NavigatorUtils.dart';
import 'package:workorder/widget/BaseWidget.dart';
import 'package:workorder/widget/HomeDrawer.dart';
import 'package:workorder/widget/MyScaffoldWidger.dart';
import 'package:workorder/widget/item/CustNoTextFieldWidget.dart';
import 'package:workorder/widget/item/UninstallCodeWidget.dart';
///
///裝機回報頁面
///Date: 2020-02-27
class InstalledReturnPage extends StatefulWidget {


  @override
  _InstalledReturnPageState createState() => _InstalledReturnPageState();
}

class _InstalledReturnPageState extends State<InstalledReturnPage> with BaseWidget{

  ///unInstallCodeData
  Map<String, dynamic> unInstallCodeData;
  ///bottomNavigatorBar index
  int _bnbIndex = 0;

  ///widget body
  Widget _body() {
    Widget body;

    body = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustNoTextFieldWidget(callBackFunc: this._callBackFuncTextField,fromFunc: 'Inst',),
          UninstallCodeWidget(jsonData: unInstallCodeData, formFunc: 'Inst', callBackFunc: _callBackICPickData,)
        ],
      ),
    );
    return body;
  }

  void _callBackFuncTextField(Map<String, dynamic> jsonData) {
    setState(() {
      unInstallCodeData = jsonData;
    });
  }

  void _callBackICPickData(Map<String, dynamic> pickData) {
    print("所選data -> $pickData");
  }

  ///bottomNavigationBar action
  void _bottomNavBarAction(int index) {
    
    setState(() {
      _bnbIndex = index;
      if(mounted) {
        switch (index) {
          case 0:
          NavigatorUtils.goHome(context);
          break;
          case 1:
          NavigatorUtils.goLogin(context);
          break;
          case 2:
          NavigatorUtils.goLogin(context);
          break;
        }
      }
    });
  }
  
  Widget _bottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: autoTextSize('首頁', TextStyle(color: Colors.white), context)
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.search),
        //   title: autoTextSize('查詢', TextStyle(color: Colors.white), context)
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app),
          title: autoTextSize('登出', TextStyle(color: Colors.white), context)
        ),
      ],
      backgroundColor: Color(MyColors.hexFromStr('#f4bf5f')),
      currentIndex: _bnbIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      onTap: _bottomNavBarAction,
    );
  }

  List<Widget> _appActions() {

    List<Widget> list = [];
    
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      drawer: HomeDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      indicatorColor: Colors.white,
      title: GestureDetector(child:Text('裝機回報', style: TextStyle(fontSize: MyScreen.homePageFontSize(context)),), onTap: () {_showSelectorController(context, dataList: []);},),
      actions: _appActions(),
      onPageChanged: (index) {
        
      },
      getBody: _body(),
      bottomNavBarChild: _bottomNavBar(),
    );
    
  }
  ///下拉選擇器
  _showSelectorController(BuildContext context, { List<dynamic> dataList, String title}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (context) {
        var dialog = CupertinoActionSheet(
          title: Text('選擇$title', style: TextStyle(fontSize: MyScreen.homePageFontSize(context)),),
          cancelButton: CupertinoActionSheetAction(
            child: Text('取消', style: TextStyle(fontSize: MyScreen.homePageFontSize(context)),),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: _selectorActions(dataList: dataList)
        );
        return dialog;
      }
    );
  }
  ///選擇器裡面的action
  List<Widget> _selectorActions({List<dynamic> dataList}) {
    List<Widget> wList = [];
    if (dataList.length > 0) 
    for (var dic in dataList) {
      wList.add(
        CupertinoActionSheetAction(
          child: autoTextSize(dic, TextStyle(color: Colors.black), context),
          onPressed: () {
            setState(() {
              
            });
          },
        )
      );
    }
    return wList;
  }
}