import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/common/utils/NavigatorUtils.dart';
import 'package:workorder/widget/BaseWidget.dart';
import 'package:workorder/widget/HomeDrawer.dart';
import 'package:workorder/widget/MyScaffoldWidger.dart';
import 'package:workorder/widget/item/CustNoTextFieldWidget.dart';
///
///裝機回報頁面
///Date: 2020-02-27
class InstalledReturnPage extends StatefulWidget {


  @override
  _InstalledReturnPageState createState() => _InstalledReturnPageState();
}

class _InstalledReturnPageState extends State<InstalledReturnPage> with BaseWidget{

  ///bottomNavigatorBar index
  int _bnbIndex = 0;

  ///widget body
  Widget _body() {
    Widget body;

    body = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustNoTextFieldWidget(callBackFunc: this._callBackFunc,),
        ],
      ),
    );
    return body;
  }

  void _callBackFunc(String custNo) {
    Fluttertoast.showToast(msg: custNo);
  }

  _getCustNoToWkNo(String str) {
      
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
      title: Text('裝機回報', style: TextStyle(fontSize: MyScreen.homePageFontSize(context)),),
      actions: _appActions(),
      onPageChanged: (index) {
        
      },
      getBody: _body(),
      bottomNavBarChild: _bottomNavBar(),
    );
    
  }
}