import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workorder/common/config/Config.dart';
import 'package:workorder/common/net/Address.dart';
import 'package:workorder/common/net/Api.dart';
import 'package:workorder/common/utils/AesUtils.dart';

import 'DaoResult.dart';

///
///基本通用dao
///Date: 2020-03-04
///
class BaseDao {
  ///客編轉工單號
  static getCustNoToWkNo(Map<String, dynamic> jsonMap) async {
    Map<String, dynamic> mainDataArray = {};
    List<dynamic> mList = new List<dynamic>();

    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("客編轉工單號req => " + str);
    }
    String custNo = jsonMap["custNo"];

    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(
        Address.getCustNoToWkNo(custNo: custNo),
        paramsData,
        null,
        new Options(method: "post", contentType: 'application/json'));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("客編轉工單號resp => " + res.data.toString());
      }
      if (res.data['retCode'] == "00") {
        mList = res.data['jsonData'];
        return new DataResult(mList, true);
      } else {
        Fluttertoast.showToast(msg: res.data["retMSG"], timeInSecForIos: 2);
        return new DataResult(null, false);
      }
    }
  }

  ///取得snr資料
  static getPingSNR(Map<String, dynamic> jsonMap) async {
    Map<String, dynamic> mainDataArray = {};

    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("取得snr資料req => " + str);
    }

    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(
        Address.getPingSNR(), paramsData, null, new Options(method: "post"));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("取得snr資料resp => " + res.data.toString());
      }
      mainDataArray = res.data;
      return new DataResult(mainDataArray, true);
    }
  }
}
