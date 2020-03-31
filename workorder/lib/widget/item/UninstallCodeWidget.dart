import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workorder/common/dao/InstalledReturnDao.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/widget/BaseWidget.dart';
import 'package:workorder/widget/dialog/IndustrySelectorDialog.dart';
import 'package:workorder/widget/dialog/UnInstallCodeItemSelectorDialog.dart';
import 'package:workorder/widget/dialog/UnInstallCodeSelectorDialog.dart';
///
///回報狀態下拉widget
///Date: 2020-03-11
class UninstallCodeWidget extends StatefulWidget {

  ///由主頁傳入data
  final Map<String, dynamic> jsonData;
  ///由主頁傳入是哪個功能進入
  final String formFunc;
  ///由主頁傳入是哪個功能進入
  final Function callBackFunc;
  UninstallCodeWidget({Key key, this.jsonData, this.formFunc, this.callBackFunc}) : super(key: key);

  @override
  _UninstallCodeWidgetState createState() => _UninstallCodeWidgetState();
}

class _UninstallCodeWidgetState extends State<UninstallCodeWidget> with BaseWidget{


  String uninstalCodeName = "回報狀態";
  String uninstallItemCodeName = "處理方式";
  String industryName = "競業選擇";
  String workDetail = "";
  List<dynamic> industryArr = [];
  List<dynamic> unInstallList = [];
  List<dynamic> unInstallCodeItemList = [];
  Map<String, dynamic> pickCodeData = Map<String, dynamic>();
  Map<String, dynamic> pickCodeItemData = Map<String, dynamic>();
  Map<String, dynamic> jsonData = Map<String, dynamic>();
  
  ///狀態下拉選定
  _callBackFuncCode(Map<String, dynamic> pickData) {
    setState(() {
      uninstalCodeName = pickData["unInstallName"];
      pickCodeData = pickData;
      _getUnInstallCodeItemData(pickCodeData);
    });
  }
  
  ///問題下拉選定
  _callBackFuncCodeItem(Map<String, dynamic> pickData) {
    setState(() {
      widget.callBackFunc(pickData);
      pickCodeItemData = pickData;
      uninstallItemCodeName = pickData["name"];
      
    });
  }

  ///競業下拉選定
  _callBackFuncIndustry(String pickData) {
    setState(() {
      industryName = pickData;
    });
  }

  ///將前頁傳入的json做處理放置在各個位置
  _analyzeJsonData() {
    setState(() {
      jsonData = widget.jsonData;
      industryArr = jsonData["industryDoor"];
      unInstallList = jsonData["unInstallList"];
      workDetail = jsonData["workDetail"];
    });
  }

  ///call installCodeItem api
  _getUnInstallCodeItemData(pickData) async {
    Map<String, dynamic> jsonMap = new Map<String, dynamic>();
    jsonMap["wkNo"] = widget.jsonData["wkNo"];
    jsonMap["unInstallCode"] = pickCodeData["unInstallCode"];

    var res = await InstalledReturnDao.getUninstallCodeItem(jsonMap);
    if (res.result) {
      setState(() {
        unInstallCodeItemList = res.data;
        uninstallItemCodeName = unInstallCodeItemList[0]["name"];
      });
    }
  }


  ///狀態選擇器
  _unInstallCodeSelectorDialog(BuildContext context) {
     return Material(
      type: MaterialType.transparency,
      child: Container(
        height: titleHeight(context) * (this.unInstallList.length + 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                height: titleHeight(context) * (this.unInstallList.length + 2),
                child: UnInstallCodeSelectorDialog(dataArray: this.unInstallList, callBackFunc: _callBackFuncCode,),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: InkWell(
                child: Container(
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  width: double.infinity,
                  height: titleHeight(context),
                  child: Center(
                    child: autoTextSize('取消', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context)), context),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            )
          ],
        )
      )
    );
  }

  ///問題選擇器
  _unInstallCodeItemSelectorDialog(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: titleHeight(context) * (this.unInstallCodeItemList.length + 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                height: titleHeight(context) * (this.unInstallCodeItemList.length + 2),
                child: UnInstallCodeItemSelectorDialog(dataArray: this.unInstallCodeItemList, callBackFunc: _callBackFuncCodeItem,),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: InkWell(
                child: Container(
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  width: double.infinity,
                  height: titleHeight(context),
                  child: Center(
                    child: autoTextSize('取消', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context)), context),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            )
          ],
        )
      )
    );
  }

  ///競業選擇器
  _industrySelectorDialog(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: titleHeight(context) * (this.industryArr.length + 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                height: titleHeight(context) * (this.industryArr.length + 2),
                child: IndustrySelectorDialog(dataArray: this.industryArr, callBackFunc: _callBackFuncIndustry,),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: InkWell(
                child: Container(
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  width: double.infinity,
                  height: titleHeight(context),
                  child: Center(
                    child: autoTextSize('取消', TextStyle(color: Colors.white, fontSize: MyScreen.homePageFontSize(context)), context),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            )
          ],
        )
      )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    if (widget.jsonData != null) {
      _analyzeJsonData();
    }
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid), bottom: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid))),
                  child: autoTextSize('狀態', TextStyle(color: Colors.black), context),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid))),
                    child: autoTextSize(uninstalCodeName, TextStyle(color: Colors.blue), context),
                  ),
                  onTap: () async {
                    if (widget.jsonData != null) {
                      showDialog(
                        context: context, 
                        builder: (BuildContext context)=> _unInstallCodeSelectorDialog(context)
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid))),
                  child: autoTextSize('內容', TextStyle(color: Colors.black), context),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    child: autoTextSize(widget.jsonData == null ? '' : workDetail, TextStyle(color: Colors.blue), context),
                  ),
                  onTap: () {

                  },
                ),
              ),
            ],
          ),
          Container(width: double.infinity, height: 1, color: Colors.black,),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid))),
                  child: autoTextSize('問題', TextStyle(color: Colors.black), context),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid))),
                    child: autoTextSize(uninstallItemCodeName, TextStyle(color: Colors.blue), context),
                  ),
                  onTap: () {
                    if (unInstallCodeItemList.length > 0) {
                      showDialog(
                        context: context, 
                        builder: (BuildContext context)=> _unInstallCodeItemSelectorDialog(context)
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: Colors.black, style: BorderStyle.solid))),
                  child: autoTextSize('競業', TextStyle(color: Colors.black), context),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    child: autoTextSize(industryName, TextStyle(color: Colors.blue), context),
                  ),
                  onTap: () {
                    if (industryArr.length > 0) {
                      showDialog(
                        context: context, 
                        builder: (BuildContext context)=> _industrySelectorDialog(context)
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
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
    for (var dic in dataList) {
      wList.add(
        CupertinoActionSheetAction(
          child: autoTextSize(dic, TextStyle(color: Colors.black), context),
          onPressed: () {
            setState(() {
              industryName = dic;
            });
          },
        )
      );
    }
    return wList;
  }
}
