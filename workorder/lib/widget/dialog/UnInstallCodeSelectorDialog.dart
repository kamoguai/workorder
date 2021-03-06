
import 'package:flutter/material.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/widget/BaseWidget.dart';

///
///回報狀態選擇器
///Date: 2020-03-23
///


class UnInstallCodeSelectorDialog extends StatelessWidget with BaseWidget{

  ///由上頁傳入dataList
  final List<dynamic> dataArray;
  ///由上頁傳入BackFuncList
  final Function callBackFunc;
  UnInstallCodeSelectorDialog({Key key,this.dataArray, this.callBackFunc}) : super(key: key);

  ///widget list item
  Widget listItem(BuildContext context, int index) {
    Widget item;
    var dicIndex = dataArray[index];
    var dic = SelectorModel.forMap(dicIndex);
    item = GestureDetector(
      child: Container(
        color: dic.backgroundColorCode == null ? Color(MyColors.hexFromStr('FFFFFF')) : Color(MyColors.hexFromStr(dic.backgroundColorCode)),
        width: double.infinity,
        height: titleHeight(context),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Center(
          child: autoTextSize(dic.unInstallName, TextStyle(color: Colors.black, fontSize: MyScreen.homePageFontSize(context)), context),
        )
      ),
      onTap: () {
        callBackFunc(dicIndex);
        Navigator.pop(context);
      },
    );
    
    return item;
  }

  ///widget list view
  Widget listView() {
    Widget list;
    if (dataArray.length > 0) {
      list = Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: listItem,
          itemCount:  dataArray.length,
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: titleHeight(context),
            child: Center(
              child: autoTextSize('選擇問題', TextStyle(color: Colors.black), context),
            ),
          ),
          dataArray.length > 0 ? listView() : Container(),
       ],
      ),
    );
  }
}

class SelectorModel {
  String unInstallName;
  String unInstallCode;
  String backgroundColorCode;
  SelectorModel();
  SelectorModel.forMap(dic) {

    unInstallName = dic["unInstallName"] == null ? "" : dic["unInstallName"];
    unInstallCode = dic["unInstallCode"] == null ? "" : dic["unInstallCode"];
    backgroundColorCode = dic["backgroundColorCode"] == null ? "" : dic["backgroundColorCode"];
    
  }
}