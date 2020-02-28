import 'dart:io';
import 'package:flutter/services.dart';
///地址數據
class Address {
  static const String ssoDomain = "http://nsso.dctv.net.tw:8081/";
  static const String aesDomain = "http://asg.dctv.net.tw:8082/EncEDI/interfaceAES?data=";
  static const String ssoDomainName = "http://wos.dctv.net.tw:8081/";
  static const String kCMHostPath = "http://msg.dctv.net.tw/api/Q2/?";
  static const String kDHostPath = "http://msg.dctv.net.tw/api/OnDuty/?";
  static const String kAreaHostPath = "http://msg.dctv.net.tw/api/AreaBugData?";
  static const String kSNRHostName = "http://snr.dctv.tw:25888/";
  static const String kSNRHostPingName = "http://snr.dctv.tw:8989/";
  static const String getSsoKey = "SSO/json/login.do?";
  static const String getVersion = "ValidataVersion/json/index!checkVersion.action?";
  static const String bundleID = "com.dctv.assignwork";
  static const String sysName = "assignwork";
  static const String packageName = "com.dctv.assignwork";
  static String workInstallDomainName = "http://wos.dctv.net.tw:8083/WorkInstall/";
  static String domainNameAES = "http://wos.dctv.net.tw:8083/WorkInstall/interfaceJsonAES";
  ///是否進入測試機
  static bool isEnterTest = false;
  
  ///app版本設在這裡
  static final String verNo = "3.20.0210";


  ///檢查是否有更新app
  static getValidateVersionAPI() {
    String deviceType = "";
    try {
      if (Platform.isAndroid) {
        deviceType = "android";
      }
      else if (Platform.isIOS) {
        deviceType = 'ios';
      }
    } on PlatformException {
      
    }
    return "$ssoDomainName/${getVersion}packageName=$bundleID&type=$deviceType&verNo=$verNo";
  }

  ///登入SSO
  static ssoLoginAPI(account, password, serialID) {
    String deviceType = "";
    try {
      if (Platform.isAndroid) {
        deviceType = "android";
      }
      else if (Platform.isIOS) {
        deviceType = 'ios';
      }
    } on PlatformException {
      
    }
    return "$ssoDomain${getSsoKey}function=login&accNo=$account&passWord=$password&uniqueCode=$serialID&sysName=$sysName&tokenType=$deviceType&tokenID=slg;ksl;dc123&packageName=$packageName&type=$deviceType";
  }
  ///登入取得使用者資訊
  ///
  ///param: sysName, accNo, passWord, ssoKey
  static getSystemUserData(String serverUrl) {
    return "$serverUrl?";
  }

  //<-------------------- 回報相關 api WorkReply -------------------->
  
  ///ping snr
  static getPingSNR() {

    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!callPingSNR.action?";
  }

  ///裝機回報送出
  static postWorkReply() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!workReply.action?";
  }

  ///裝機回報狀態
  static getUninstallCode() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!getBookUninstallCode.action?";
  }

  ///裝機回報處理方式
  static getUninstallCodeItem() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!getBookUninstallCodeItem.action?";
  }

  ///客編轉工單號
  static getCustNoToWkNo() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!custNoToWkNO.action?"; 
  }

  ///維修換機送出
  static postRepairReply() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!repairReply.action?"; 
  }

  ///維修回報狀態
  static getRepairUninstallCode() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!getRepairUninstallCode.action?"; 
  }

  ///維修回報處理方式
  static getRepairUninstallCodeItem() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!getRepairUninstallCodeItem.action?"; 
  }

  ///設備回收送出
  static postRecyclingReply() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!RecyclingReply.action?"; 
  }

  ///設備回收狀態
  static getRYCUninstallCode() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!getRYCUninstallCode.action?"; 
  }

  ///設備回收處理方式
  static getRYCUninstallCodeItem() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!getRYCUninstallCodeItem.action?"; 
  }

  ///刷新授權查詢
  static getCustomerInfo() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!customerInfo.action?"; 
  }

  ///刷新授權
  static postCustAuthRepeat() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!custAuthRepeat.action?"; 
  }

  ///獨立貓開通&換機
  static postCMAuth() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!CMAuth.action?"; 
  }

  ///STB開通(大盒子掃QRCode)
  static postBookingOrReplaceAuth() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!bookingOrReplaceAuth.action?"; 
  }

  ///小盒子開通
  static postBookingAuthN9201() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!bookingAuthN9201.action?"; 
  }

  ///小盒子查詢
  static getN9201Info() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!getN9201Info.action?"; 
  }

  ///小盒子換機
  static postReplaceAuthN9201() {
    changeEnterTest();
    return "${ssoDomainName}WorkReply/json/interface!replaceAuthN9201.action?"; 
  }

  

  //<-------------------- SNR相關 api SNR -------------------->

  ///新增回報log
  static postAddReportLog({custNo, description, userNo, userName,}) {
    changeEnterTest();
    return "${kSNRHostName}SNRProcess?FunctionName=AddReportLog&CustCD=$custNo&InputText=$description&SenderID=$userNo.accNo&SenderName=$userName&From=WorkReply";
  }
  


  //<-------------------- 切換頻道 -------------------->
  ///切換測/正式機路徑
  static changeEnterTest() async {
    if (isEnterTest) {
      workInstallDomainName = "http://labedi.dctv.net.tw:8080/WorkInstall/";
      domainNameAES = "http://labedi.dctv.net.tw:8080/WorkInstall/interfaceJsonAES";
    }
    else {
      workInstallDomainName = "http://wos.dctv.net.tw:8083/WorkInstall/";
      domainNameAES = "http://wos.dctv.net.tw:8083/WorkInstall/interfaceJsonAES";
    }
  }


}