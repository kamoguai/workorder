import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:workorder/common/config/Config.dart';
import 'package:workorder/common/dao/DaoResult.dart';
import 'package:workorder/common/net/Address.dart';
import 'package:workorder/common/net/Api.dart';
import 'package:workorder/common/utils/AesUtils.dart';
///
///設備回收相關dao
///Date: 2020-02-28
class DeviceRecoverDao {

  ///設備回收送出
  static postRecyclingReply(Map<String,dynamic> jsonMap) async { 
    Map<String, dynamic> mainDataArray = {};
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("設備回報送出req => " + str);
    }
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.postRecyclingReply(), paramsData, null, new Options(method: "post"));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("設備回報送出resp => " + res.data.toString());
      }
      mainDataArray = res.data;
      return new DataResult(mainDataArray, true);
    }
  }

  ///設備回收狀態下拉
  static getRYCUninstallCode(Map<String,dynamic> jsonMap) async { 
    Map<String, dynamic> mainDataArray = {};
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("設備回報狀態req => " + str);
    }
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.getRYCUninstallCode(), paramsData, null, new Options(method: "post"));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("設備回報狀態resp => " + res.data.toString());
      }
      mainDataArray = res.data;
      return new DataResult(mainDataArray, true);
    }
  }

  ///設備回收處理方式下拉
  static getRYCUninstallCodeItem(Map<String,dynamic> jsonMap) async { 
    Map<String, dynamic> mainDataArray = {};
    ///map轉json
    String str = json.encode(jsonMap);
    if (Config.DEBUG) {
      print("設備回報處理方式req => " + str);
    }
    ///aesEncode
    var aesData = AesUtils.aes128Encrypt(str);
    Map paramsData = {"data": aesData};
    var res = await HttpManager.netFetch(Address.getRYCUninstallCodeItem(), paramsData, null, new Options(method: "post"));
    if (res != null && res.result) {
      if (Config.DEBUG) {
        print("設備回報處理方式resp => " + res.data.toString());
      }
      mainDataArray = res.data;
      return new DataResult(mainDataArray, true);
    }
  }
}