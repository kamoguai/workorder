
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/common/utils/NavigatorUtils.dart';
import 'package:workorder/widget/BaseWidget.dart';
import 'package:workorder/widget/HomeDrawer.dart';
import 'package:workorder/widget/MyScaffoldWidger.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  static final String sName = "home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseWidget, SingleTickerProviderStateMixin {

  ///bottomNavigatorBar index
  int _bnbIndex = 0;

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
    list.add(
      IconButton(
        icon: Icon(Icons.camera),
        onPressed: (){

        },
      )
    );
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      drawer: HomeDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      indicatorColor: Colors.white,
      title: Text('首頁', style: TextStyle(fontSize: MyScreen.homePageFontSize(context)),),
      actions: _appActions(),
      onPageChanged: (index) {
        
      },
      bottomNavBarChild: _bottomNavBar(),
    );
    
  }
}
