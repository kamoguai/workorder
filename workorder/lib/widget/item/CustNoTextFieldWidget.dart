import 'package:flutter/material.dart';
import 'package:workorder/widget/BaseWidget.dart';
///
/// 客編/工單，輸入用widget
/// Date: 2020-02-27
/// 
class CustNoTextFieldWidget extends StatelessWidget with BaseWidget{

  TextEditingController textController =  TextEditingController();
  FocusNode textNode =  FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: autoTextSize('客編', TextStyle(color: Colors.blue), context),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: TextField(
                onSubmitted: (value) {
                  this.textController.text = value;
                  print(value);
                },
                controller: textController,
                focusNode: textNode,
                decoration: InputDecoration(
                  labelText: '客編',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                ),
              ), 
            ),
          ),
          Expanded(
            child: Container(
              child: FlatButton(
                child: autoTextSize('查詢', TextStyle(color: Colors.white), context),
                color: Colors.blueAccent,
                onPressed: () {
                  print('button click => ' + this.textController.text);
                },
              ),
            ),
          ),
        ],

      ),
    );
  }
}