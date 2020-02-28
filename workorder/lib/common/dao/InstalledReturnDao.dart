import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:workorder/common/config/Config.dart';
import 'package:workorder/common/net/Api.dart';

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
    
  }

}