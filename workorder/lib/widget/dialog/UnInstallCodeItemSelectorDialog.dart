
import 'package:flutter/material.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/widget/BaseWidget.dart';

///
///回報問題選擇器
///Date: 2020-03-24
///
class UnInstallCodeItemSelectorDialog extends StatelessWidget with BaseWidget{

  ///由前頁傳入data
  final List<dynamic> dataArray;
  ///由前頁傳入callback func
  final Function callBackFunc;
  UnInstallCodeItemSelectorDialog({this.dataArray, this.callBackFunc});

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
          child: autoTextSize(dic.name, TextStyle(color: Colors.black, fontSize: MyScreen.homePageFontSize(context)), context),
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
  String code;
  String name;
  String backgroundColorCode;
  SelectorModel();

  SelectorModel.forMap(dic) {
    code = dic["code"] == null ? "" : dic["code"];
    name = dic["name"] == null ? "" : dic["name"];
    backgroundColorCode = dic["backgroundColorCode"] == null ? "" : dic["backgroundColorCode"];
  }
}