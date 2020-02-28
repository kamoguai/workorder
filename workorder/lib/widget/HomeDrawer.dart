import 'package:workorder/common/model/UserInfo.dart';
import 'package:workorder/common/redux/SysState.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/common/utils/NavigatorUtils.dart';
import 'package:workorder/widget/BaseWidget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

import '../common/utils/NavigatorUtils.dart';

///
///左側sider menu
///Date: 2019-10-14
class HomeDrawer extends StatelessWidget with BaseWidget {
  
 @override
  autoTextSize(text, style, context) {
    var fontSize = MyScreen.homePageFontSize(context);
    var fontStyle = TextStyle(fontSize: fontSize);
    return AutoSizeText(
      text,
      style: style.merge(fontStyle),
      minFontSize: 5.0,
      textAlign: TextAlign.center,
    );
  }

  @override
  autoTextSizeLeft(text, style, context) {
    var fontSize = MyScreen.homePageFontSize(context);
    var fontStyle = TextStyle(fontSize: fontSize);
    return AutoSizeText(
      text,
      style: style.merge(fontStyle),
      minFontSize: 5.0,
      textAlign: TextAlign.left,
    );
  }

  @override
  Widget build(BuildContext context) {
    var nowDate = DateTime.now();
    final dft = new DateFormat('yyyy/MM/dd (EEE)');
    var nowStr = dft.format(nowDate);
    return Material(
      child: StoreBuilder<SysState>(
        builder: (context, store) {
          UserInfo user = store.state.userInfo;
          return Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail: autoTextSize('帳號：${user.accNo} ${user.empName}', TextStyle(color: Colors.grey[700]), context), 
                  accountName: autoTextSize('部門：${user.deptName}', TextStyle(color: Colors.grey[700]), context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('static/images/backGround.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                GestureDetector(
                  child: ListTile(
                    title: autoTextSizeLeft('<1> 裝機回報', TextStyle(color: Colors.black), context)
                  ),
                  onTap: (){
                    NavigatorUtils.goInstalledReturn(context);
                  },
                ),
                
                Divider(),///分隔線
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: ListTile(
                      title: Text('$nowStr', style: TextStyle(color: Colors.blue, fontSize: MyScreen.homePageFontSize(context)),textAlign: TextAlign.right,),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}