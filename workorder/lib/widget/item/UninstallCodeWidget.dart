import 'package:flutter/material.dart';
import 'package:workorder/widget/BaseWidget.dart';
///
///回報狀態下拉widget
///Date: 2020-03-11
class UninstallCodeWidget extends StatefulWidget {

  ///由主頁傳入data
  final Map<String, dynamic> jsonData;
  ///由主頁傳入是哪個功能進入
  final String formFunc;
  UninstallCodeWidget({this.jsonData, this.formFunc});

  @override
  _UninstallCodeWidgetState createState() => _UninstallCodeWidgetState();
}

class _UninstallCodeWidgetState extends State<UninstallCodeWidget> with BaseWidget{


  String uninstalCodeName = "回報狀態";
  String uninstallItemCodeName = "處理方式";
  String industryName = "競業選擇";
  String workDetail = "";
  List<String> industryArr = [];
  List<dynamic> unInstallArr = [];



  @override
  Widget build(BuildContext context) {

    if (widget.jsonData == null) {
      print('回報下拉data == null');
    }
    else {
      print('回報下拉data ->${widget.jsonData}');
    }
    return Container(
      height: titleHeight(context) * 1.5,
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
                  onTap: () {

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
                    child: autoTextSize('', TextStyle(color: Colors.blue), context),
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

                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
