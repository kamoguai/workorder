import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:workorder/common/config/Config.dart';
import 'package:workorder/common/dao/DaoResult.dart';
import 'package:workorder/common/net/Address.dart';
import 'package:workorder/common/net/Api.dart';
import 'package:workorder/common/utils/AesUtils.dart';

///
///裝機回報相關dao
///Date: 2020-02-28
class InstalledReturnDao {
  ///裝機回報送出
  static postWorkReply(Map<String,dynamic> jsonMap) async {
    Map<String, dynamic> mainDataArray = {};
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("裝機回報送出req => " + str);
    }
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.postWorkReply(), paramsData, null, new Options(method: "post"));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("裝機回報送出resp => " + res.data.toString());
      }
      mainDataArray = res.data;
      return new DataResult(mainDataArray, true);
    }
  }

  ///裝機回報狀態下拉
  static getUninstallCode(Map<String,dynamic> jsonMap) async {
    Map<String, dynamic> mainDataArray = {};
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("裝機回報狀態req => " + str);
    }
    String wkNo = jsonMap["wkNo"];
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.getUninstallCode(wkNo: wkNo), paramsData, null, new Options(method: "post", contentType: ContentType.json));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("裝機回報狀態resp => " + res.data.toString());
      }
      if (res.data['retCode'] == "00") {
        
        mainDataArray = res.data["jsonData"];
      }
      return new DataResult(mainDataArray, true);
    }
  }

  ///裝機回報處理方式下拉
  static getUninstallCodeItem(Map<String,dynamic> jsonMap) async {
    List<dynamic> dataArray = [];
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("裝機回報處理方式req => " + str);
    }
    String wkNo = jsonMap["wkNo"];
    String unInstallCode = jsonMap["unInstallCode"];
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.getUninstallCodeItem(wkNo: wkNo, unInstallCode: unInstallCode), paramsData, null, new Options(method: "post", contentType: ContentType.json));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("裝機回報處理方式resp => " + res.data.toString());
      }
      if (res.data['retCode'] == "00") {

        dataArray = res.data["jsonData"];
      }
      return new DataResult(dataArray, true);
    }
  }



}