import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workorder/common/dao/BaseDao.dart';
import 'package:workorder/common/dao/DeviceRecoverDao.dart';
import 'package:workorder/common/dao/InstalledReturnDao.dart';
import 'package:workorder/common/dao/ServiceReturnDao.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/common/utils/CommonUtils.dart';
import 'package:workorder/widget/BaseWidget.dart';
///
/// 客編/工單，輸入用widget
/// Date: 2020-02-27
/// 
class CustNoTextFieldWidget extends StatefulWidget {

  ///將結果返回主頁
  final Function callBackFunc;
  ///來自功能
  final String fromFunc;

  CustNoTextFieldWidget({this.callBackFunc, this.fromFunc});

  @override
  _CustNoTextFieldWidgetState createState() => _CustNoTextFieldWidgetState();
}

class _CustNoTextFieldWidgetState extends State<CustNoTextFieldWidget> with BaseWidget{
  TextEditingController textController =  TextEditingController();
  FocusNode textNode =  FocusNode();
  var nowType = searchType.custNo;
  ///呼叫客編轉工單
  _getCustNoToWkNo() async {
      Map<String, dynamic> jsonMap = new Map<String, dynamic>();
      jsonMap["custNo"] = textController.text;
      CommonUtils.showLoadingDialog(context);
      var res = await BaseDao.getCustNoToWkNo(jsonMap);
      Navigator.pop(context);
      if (res.result) {
        var result = res.data[0]['wkNo'];
        setState(() {
          textController.text  = result;
          nowType = searchType.wkNo;
          _getCode(wkNo: result);
        });
      }
  }

  ///取得狀態下拉選單
  _getCode({wkNo}) async {

      switch(widget.fromFunc) {
        case 'Inst':
          await _getUninstallCode(wkNo: wkNo);
          break;
        case "Repair": 
          await _getRepairUninstallCode(wkNo: wkNo);
          break;
        case "Recover":
          await _getRYCUninstallCode(wkNo: wkNo);
          break;

      }


  }

  ///取得裝機狀態下拉選單
  _getUninstallCode({wkNo}) async {
    Map<String, dynamic> jsonMap = new Map<String, dynamic>();
    jsonMap["wkNo"] = wkNo;
    CommonUtils.showLoadingDialog(context);
    var res = await InstalledReturnDao.getUninstallCode(jsonMap);
    Navigator.pop(context);
    if (res.result) {
      Map<String, dynamic> resData = Map<String, dynamic>();
      resData = res.data;
      resData["wkNo"] = wkNo;
      widget.callBackFunc(resData);
    }
  }

  ///取得維修狀態下拉選單
  _getRepairUninstallCode({wkNo}) async {
    Map<String, dynamic> jsonMap = new Map<String, dynamic>();
    jsonMap["wkNo"] = wkNo;
    CommonUtils.showLoadingDialog(context);
    var res = await ServiceReturnDao.getRepairUninstallCode(jsonMap);
    Navigator.pop(context);
    if (res.result) {

    }
  }

  ///取得設備回收狀態下拉選單
  _getRYCUninstallCode({wkNo}) async {
    Map<String, dynamic> jsonMap = new Map<String, dynamic>();
    jsonMap["wkNo"] = wkNo;
    CommonUtils.showLoadingDialog(context);
    var res = await DeviceRecoverDao.getRYCUninstallCode(jsonMap);
    Navigator.pop(context);
    if (res.result) {

    }
  }
  
  @override
  void initState() {
   super.initState();
   textController.text = "2470011355"; 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                child: autoTextSize(nowType == searchType.custNo ? '客編' : '工單', TextStyle(color: Colors.blue), context),
              ),
              onTap: () {
                _changeType();
              },
            ), 
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: TextField(
                onSubmitted: (value) {
                  this.textController.text = value;
                  print(value);
                },
                controller: textController,
                focusNode: textNode,
                maxLength: nowType == searchType.custNo ? 10 : 15,
                decoration: InputDecoration(
                  labelText: nowType == searchType.custNo ? '客編' : '工單',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                ),
                style: TextStyle(fontSize: MyScreen.defaultTableCellFontSize(context)),
              ), 
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: FlatButton(
                child: autoTextSize('查詢', TextStyle(color: Colors.white), context),
                color: Colors.blueAccent,
                onPressed: () {
                  textNode.unfocus();
                  if (validTextValue()) {
                    if (nowType == searchType.custNo) {
                      _getCustNoToWkNo();
                    }
                    else {
                      _getCode(wkNo: textController.text);
                    }
                  }
                },
              ),
            ),
          ),
        ],

      ),
    );
  }

  void _changeType() {
    setState(() {
      if (nowType == searchType.custNo) {
        nowType = searchType.wkNo;
      }
      else {
        nowType = searchType.custNo;
      }
      textController.clear();
    });
  }

  bool validTextValue() {
    bool f = false;
    if (textController.text.length == 0) {
      if (nowType == searchType.custNo) {
        Fluttertoast.showToast(msg: '尚未輸入客編', timeInSecForIos: 2, gravity: ToastGravity.CENTER, fontSize: MyScreen.defaultTableCellFontSize(context));
      }
      else {
        Fluttertoast.showToast(msg: '尚未輸入工單', timeInSecForIos: 2, gravity: ToastGravity.CENTER, fontSize: MyScreen.defaultTableCellFontSize(context));
      }
    }
    else {
      if (nowType ==searchType.custNo) {
        if (textController.text.length < 10) {
          Fluttertoast.showToast(msg: '輸入客編不得少於10位數', timeInSecForIos: 2, gravity: ToastGravity.CENTER, fontSize: MyScreen.defaultTableCellFontSize(context));
        }
        else {
          f = true;
        }
      }
      else {
        if (textController.text.length < 15) {
          Fluttertoast.showToast(msg: '輸入工單不得少於15位數', timeInSecForIos: 2, gravity: ToastGravity.CENTER, fontSize: MyScreen.defaultTableCellFontSize(context));
        }
        else {
          f = true;
        }
      }
    }
    return f;
  }
}

enum searchType {
  custNo,
  wkNo
}