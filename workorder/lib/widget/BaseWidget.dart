
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * 基本widget，供重複使用的widget
 * Date: 2019-05-09
 */
mixin BaseWidget{
  ///可選地區json
  final areaAddressJson = """
   [
      {
        "code": "236/ROOT",
        "name": "土城區"
      },
      {
        "code": "241/ROOT",
        "name": "三重區"
      },
      {
        "code": "242/ROOT",
        "name": "新莊區"
      },
      {
        "code": "247/ROOT",
        "name": "蘆洲區"
      },
      {
        "code": "220/ROOT",
        "name": "板橋區"
      }
    ]
  """;
  ///讀取用dialog
  static Future<void> showLoadingDialog(BuildContext context) async {
    Widget dialog;
    showDialog(
      context: context,
      builder: (BuildContext context) => dialog
    );
    dialog =  Material(
      type: MaterialType.transparency,
      child: Center(
       child: new Container(
        width: 150.0,
          height: 150.0,
          padding: new EdgeInsets.all(4.0),
          decoration: new BoxDecoration(
            color: Colors.black45,
            //用一个BoxDecoration装饰器提供背景图片
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(child: SpinKitCubeGrid(color: Colors.white)),
              new Container(height: 10.0),
              new Container(child: new Text('資料讀取中..', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(20.0)))),
            ],
          ),
        )
      ),
    );
  }
  ///讀取結束用
  hidenLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
  ///anime loding
  showLoadingAnime(BuildContext context) {
    return Center(
      child: new Container(
        width: 150.0,
        height: 150.0,
        padding: new EdgeInsets.all(4.0),
        decoration: new BoxDecoration(
          color: Colors.black45,
          //用一个BoxDecoration装饰器提供背景图片
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(child: SpinKitCubeGrid(color: Colors.white)),
            new Container(height: 10.0),
            new Container(child: new Text('資料讀取中..', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(20.0)))),
          ],
        ),
      )
    );
  }

  ///anime loding blue
  showLoadingAnimeB(BuildContext context) {
    return Center(
      child: new Container(
        width: 150.0,
        height: 150.0,
        padding: new EdgeInsets.all(4.0),
        decoration: new BoxDecoration(
          color: Colors.transparent,
          //用一个BoxDecoration装饰器提供背景图片
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(child: SpinKitCubeGrid(color: Colors.blue[200])),
            new Container(height: 10.0),
            new Container(child: new Text('資料讀取中..', style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(20.0)))),
          ],
        ),
      )
    );
  }
  ///分隔線
  buildLine() {
    return new Container(
      height: 1.0,
      color: Colors.grey,
    );
  }
   ///分隔線-紅
  buildRedLine() {
    return new Container(
      height: 1.0,
      color: Colors.red,
    );
  }

  ///高分隔線
  buildLineHeight(BuildContext context) {
    return new Container(
      height: titleHeight(context),
      width: 1.0,
      color: Colors.grey,
    );
  }
  ///高分隔線-red
  buildLineHeightRed(BuildContext context) {
    return new Container(
      height: titleHeight(context),
      width: 1.0,
      color: Colors.red,
    );
  }

  ///高分隔線
  buildRedLineHeight(BuildContext context) {
    return new Container(
      height: titleHeight(context),
      width: 1.0,
      color: Colors.red,
    );
  }
  ///51高分隔線
  buildHeightLine51() {
    return new Container(
      height: 51.0,
      width: 1.0,
      color: Colors.grey,
    );
  }

  ///取得裝置width並切2份
  deviceWidth2(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 2;
  }

   ///取得裝置width並切3份
  deviceWidth3(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 3;
  }

   ///取得裝置width並切4份
  deviceWidth4(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 4;
  }

  ///取得裝置width並切5份
  deviceWidth5(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 5;
  }

  ///取得裝置width並切6份
  deviceWidth6(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 6;
  }

  ///取得裝置width並切7份
  deviceWidth7(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 7;
  }

  ///取得裝置width並切8份
  deviceWidth8(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 8;
  }
  ///取得裝置width並切9份
  deviceWidth9(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 9;
  }
  ///取得裝置width並切10份
  deviceWidth10(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return width / 10;
  }
  ///取得裝置width並切9 * 2 + 9 * 0.5 份
  deviceWidth92(context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    var width9 =  deviceWidth / 9;
    return (width9 * 2) + (width9 * 0.5);
  }

  ///取得裝置height切4分
  deviceHeight4(BuildContext context) {
    AppBar appBar = AppBar();
    var appBarHeight = appBar.preferredSize.height;
    var deviceHeight = MediaQuery.of(context).size.height;
    var height = deviceHeight - appBarHeight;

    return height / 4;
  }

  ///lsit height
  listHeight(BuildContext context) {
    var height = deviceHeight4(context);
    return height / 5;
  }

  ///title height
  titleHeight(BuildContext context) {
    var height = deviceHeight4(context);
    return height / 4;
  }

  ///自動縮放-中
  autoTextSize(text, style, context) {
    var fontSize = MyScreen.defaultTableCellFontSize(context);
    var fontStyle = TextStyle(fontSize: fontSize);
    return AutoSizeText(
      text,
      style: style.merge(fontStyle),
      minFontSize: 5.0,
      textAlign: TextAlign.center,
    );
  }

  ///自動縮放-左
  autoTextSizeLeft(text, style, context) {
    var fontSize = MyScreen.defaultTableCellFontSize(context);
    var fontStyle = TextStyle(fontSize: fontSize);
    return AutoSizeText(
      text,
      style: style.merge(fontStyle),
      minFontSize: 5.0,
      textAlign: TextAlign.left,
    );
  }

  ///地址隱碼
  addressEncode(String addr) {
    final fullLength = addr.length;
    final rex = addr.indexOf(new RegExp(r'[0-9]'));
    var sub1 = addr.substring(0,rex);
    var sub2 = addr.substring(rex, fullLength);
    var sub3 = '';
    if (sub2.indexOf('巷') > 1) {
      sub3 = sub2.substring(0, sub2.indexOf('巷'));
      for (var i=0; i<sub3.length; i++ ) {
        sub1 += '*';
      }
      sub1 += '巷';
      sub3 = '';
    }
    if (sub2.indexOf('弄') > 1) {
      if (sub2.indexOf('巷') > 1) {
        sub3 = sub2.substring(sub2.indexOf('巷') + 1, sub2.indexOf('弄'));
      }
      else {
        sub3 = sub2.substring(0, sub2.indexOf('弄'));
      }
      for (var i=0; i<sub3.length; i++ ) {
        sub1 += '*';
      }
      sub1 += '弄';
      sub3 = '';
    }
    if (sub2.indexOf('號') > 1) {
      if (sub2.indexOf('弄') > 1) {
        sub3 = sub2.substring(sub2.indexOf('弄') + 1, sub2.indexOf('號'));
        print('弄號 -> $sub3');
      }
      else if (sub2.indexOf('巷') > 1) {
        sub3 = sub2.substring(sub2.indexOf('巷') + 1, sub2.indexOf('號'));
        print('號巷 -> $sub3');
      }
      else {
        sub3 = sub2.substring(0, sub2.indexOf('號')); 
      }
      for (var i=0; i<sub3.length; i++ ) {
        sub1 += '*';
      }
      sub1 += '號';
      sub3 = '';
    }
    if (sub2.indexOf('樓') > 1) {
      String lastStr = sub2.substring(sub2.indexOf('樓') + 1, sub2.length);
      print('final addr -> $lastStr');
      sub1 += '**樓';
      sub1 += lastStr;
    }
    else {
       String lastStr = sub2.substring(sub2.indexOf('號') + 1, sub2.length);
       sub1 += lastStr;
    }
    return sub1;
  }

  ///客編隱碼
  custCodeEncode(String str) {
    String showStr = "";
    String sub1 = str.substring(0,3);
    showStr += sub1;
    showStr += "*****";
    String sub2 = str.substring(8,10);
    showStr += sub2;
    return showStr;  
  }
}