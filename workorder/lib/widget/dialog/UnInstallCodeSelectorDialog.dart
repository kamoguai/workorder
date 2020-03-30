
import 'package:flutter/material.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/widget/BaseWidget.dart';

///
///回報狀態選擇器
///Date: 2020-03-23
///
class UnInstallCodeSelectorDialog extends StatefulWidget {
  ///由上頁傳入dataList
  final List<dynamic> dataList;
  ///由上頁傳入BackFuncList
  final Function callBackFunc;
  UnInstallCodeSelectorDialog({Key key,this.dataList, this.callBackFunc}) : super(key: key);
  @override
  _UnInstallCodeSelectorDialogState createState() => _UnInstallCodeSelectorDialogState();
}

class _UnInstallCodeSelectorDialogState extends State<UnInstallCodeSelectorDialog> with BaseWidget{

  ///裝載資料
  List<dynamic> dataArray = [];
  ///所選資料
  Map<String, dynamic> pickData = {};
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
        setState(() {
          pickData = dicIndex;
          widget.callBackFunc(pickData);
          Navigator.pop(context);
        });
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
  void initState() {
    super.initState();
    dataArray = widget.dataList;
  }

  @override
  void dispose() {
    super.dispose();
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
          widget.dataList.length > 0 ? listView() : Container(),
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