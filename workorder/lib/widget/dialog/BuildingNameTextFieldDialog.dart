
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workorder/common/style/MyStyle.dart';
import 'package:workorder/widget/BaseWidget.dart';



///
///華夏大樓輸入dialog
///Date: 2020-03-31
///
class BuildingNameTextFieldDialog extends StatefulWidget {

  ///將結果返回主頁
  final Function callBackFunc;
  BuildingNameTextFieldDialog({this.callBackFunc});

  @override
  _BuildingNameTextFieldDialogState createState() => _BuildingNameTextFieldDialogState();
}

class _BuildingNameTextFieldDialogState extends State<BuildingNameTextFieldDialog> with BaseWidget{

  TextEditingController textController =  TextEditingController();
  FocusNode textNode =  FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: titleHeight(context) * 4,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              child: TextField(
                 onSubmitted: (value) {
                  this.textController.text = value;
                  print(value);
                },
                controller: textController,
                focusNode: textNode,
                decoration: InputDecoration(
                  labelText: '請輸入大樓名稱',
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: FlatButton(
                child: autoTextSize('確定', TextStyle(color: Colors.white), context),
                color: Colors.blueAccent,
                onPressed: () {
                  textNode.unfocus();
                  if (validTextValue()) {
                    widget.callBackFunc(textController.text);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  ///輸入檢核
  bool validTextValue() {
    bool f = false;
    if (textController.text.length == 0) {
      Fluttertoast.showToast(msg: '尚未輸大樓名稱', timeInSecForIos: 2, gravity: ToastGravity.CENTER, fontSize: MyScreen.defaultTableCellFontSize(context));
    }
    else {
      f = true;
    }
    return f;
  }
}