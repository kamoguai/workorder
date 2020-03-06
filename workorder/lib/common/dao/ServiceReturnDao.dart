import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:workorder/common/config/Config.dart';
import 'package:workorder/common/dao/DaoResult.dart';
import 'package:workorder/common/net/Address.dart';
import 'package:workorder/common/net/Api.dart';
import 'package:workorder/common/utils/AesUtils.dart';

///
///維修回報相關dao
///Date: 2020-02-28
class ServiceReturnDao {

  ///維修回報送出
  static postRepairReply(Map<String,dynamic> jsonMap) async { 
    Map<String, dynamic> mainDataArray = {};
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("維修回報送出req => " + str);
    }
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.postRepairReply(), paramsData, null, new Options(method: "post"));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("維修回報送出resp => " + res.data.toString());
      }
      mainDataArray = res.data;
      return new DataResult(mainDataArray, true);
    }
  }

  ///維修回報狀態下拉
  static getRepairUninstallCode(Map<String,dynamic> jsonMap) async { 
    Map<String, dynamic> mainDataArray = {};
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("維修回報狀態req => " + str);
    }
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.getRepairUninstallCode(), paramsData, null, new Options(method: "post"));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("維修回報狀態resp => " + res.data.toString());
      }
      mainDataArray = res.data;
      return new DataResult(mainDataArray, true);
    }
  }

  ///維修回報處理方式下拉
  static getRepairUninstallCodeItem(Map<String,dynamic> jsonMap) async { 
    Map<String, dynamic> mainDataArray = {};
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("維修回報處理方式req => " + str);
    }
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.getRepairUninstallCodeItem(), paramsData, null, new Options(method: "post"));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("維修回報處理方式resp => " + res.data.toString());
      }
      mainDataArray = res.data;
      return new DataResult(mainDataArray, true);
    }
  }

}