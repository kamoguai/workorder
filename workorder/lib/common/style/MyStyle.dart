import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
///颜色
class MyColors {
  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";

  static const int primaryValue = 0xFF2D8FBB;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xffececec;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xff267aff;
  static const int subTextColor = 0xff959595;
  static const int subLightTextColor = 0xffc4c4c4;

  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );

  ///將hex color傳入轉成輸出樣式e.g. ff0000
  static int hexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
}

///文本样式
class MyConstant {
  static const String app_default_share_url =
      "https://github.com/CarGuo/MyGithubAppFlutter";

  static const textSize_40 = 40.0;
  static const textSize_30 = 30.0;
  static const textSize_28 = 28.0;
  static const textSize_26 = 26.0;
  static const textSize_24 = 24.0;
  static const textSize_22 = 22.0;
  static const textSize_20 = 20.0;
  static const textSize_18 = 18.0;
  static const textSize_16 = 16.0;
  static const textSize_14 = 14.0;
  static const textSize_12 = 12.0;
  static const textSize_10 = 10.0;
  static const textSize_8 = 8.0;

  static const minText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: textSize_12,
  );

  static const smallTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: textSize_14,
  );

  static const smallText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: textSize_14,
  );

  static const smallTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: textSize_14,
    fontWeight: FontWeight.bold,
  );

  static const smallSubLightText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: textSize_14,
  );

  static const smallActionLightText = TextStyle(
    color: Color(MyColors.actionBlue),
    fontSize: textSize_14,
  );

  static const smallMiLightText = TextStyle(
    color: Color(MyColors.miWhite),
    fontSize: textSize_14,
  );

  static const smallSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: textSize_14,
  );

  static const middleText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: textSize_16,
  );

  static const middleTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: textSize_16,
  );

  static const middleSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: textSize_16,
  );

  static const middleSubLightText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: textSize_16,
  );

  static const middleTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: textSize_16,
    fontWeight: FontWeight.bold,
  );

  static const middleTextWhiteBold = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: textSize_16,
    fontWeight: FontWeight.bold,
  );

  static const middleSubTextBold = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: textSize_16,
    fontWeight: FontWeight.bold,
  );

  static const normalText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: textSize_18,
  );

  static const normalTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: textSize_18,
    fontWeight: FontWeight.bold,
  );

  static const normalSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: textSize_18,
  );

  static const normalTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: textSize_18,
  );

  static const normalTextMitWhiteBold = TextStyle(
    color: Color(MyColors.miWhite),
    fontSize: textSize_18,
    fontWeight: FontWeight.bold,
  );

  static const normalTextActionWhiteBold = TextStyle(
    color: Color(MyColors.actionBlue),
    fontSize: textSize_18,
    fontWeight: FontWeight.bold,
  );

  static const normalTextLight = TextStyle(
    color: Color(MyColors.primaryLightValue),
    fontSize: textSize_18,
  );

  static const largeText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: textSize_20,
  );

  static const largeTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: textSize_20,
    fontWeight: FontWeight.bold,
  );

  static const largeTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: textSize_20,
  );

  static const largeTextWhiteBold = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: textSize_20,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: textSize_30,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeText = TextStyle(
    color: Color(MyColors.primaryValue),
    fontSize: textSize_30,
    fontWeight: FontWeight.bold,
  );
}

class MyICons {
  static const String FONT_FAMILY = 'wxcIconFont';

  static const String DEFAULT_USER_ICON = 'static/images/logo_small.png';
  static const String DEFAULT_IMAGE = 'static/images/default_img.png';
  static const String DEFAULT_REMOTE_PIC =
      'https://raw.githubusercontent.com/CarGuo/MyGithubAppFlutter/master/static/images/logo.png';

  static const String SQUARE_FRAME_PIC = 'static/images/square-frame.png';
  static const String DCTV_LOGO_ICON = 'static/images/logo.png';

  static const IconData HOME =
      const IconData(0xe624, fontFamily: MyICons.FONT_FAMILY);
  static const IconData MORE =
      const IconData(0xe674, fontFamily: MyICons.FONT_FAMILY);
  static const IconData SEARCH =
      const IconData(0xe61c, fontFamily: MyICons.FONT_FAMILY);

  static const IconData MAIN_DT =
      const IconData(0xe684, fontFamily: MyICons.FONT_FAMILY);
  static const IconData MAIN_QS =
      const IconData(0xe818, fontFamily: MyICons.FONT_FAMILY);
  static const IconData MAIN_MY =
      const IconData(0xe6d0, fontFamily: MyICons.FONT_FAMILY);
  static const IconData MAIN_SEARCH =
      const IconData(0xe61c, fontFamily: MyICons.FONT_FAMILY);

  static const IconData LOGIN_USER =
      const IconData(0xe666, fontFamily: MyICons.FONT_FAMILY);
  static const IconData LOGIN_PW =
      const IconData(0xe60e, fontFamily: MyICons.FONT_FAMILY);

  static const IconData REPOS_ITEM_USER =
      const IconData(0xe63e, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_STAR =
      const IconData(0xe643, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_FORK =
      const IconData(0xe67e, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_ISSUE =
      const IconData(0xe661, fontFamily: MyICons.FONT_FAMILY);

  static const IconData REPOS_ITEM_STARED =
      const IconData(0xe698, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_WATCH =
      const IconData(0xe681, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_WATCHED =
      const IconData(0xe629, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_DIR = Icons.folder;
  static const IconData REPOS_ITEM_FILE =
      const IconData(0xea77, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_NEXT =
      const IconData(0xe610, fontFamily: MyICons.FONT_FAMILY);

  static const IconData USER_ITEM_COMPANY =
      const IconData(0xe63e, fontFamily: MyICons.FONT_FAMILY);
  static const IconData USER_ITEM_LOCATION =
      const IconData(0xe7e6, fontFamily: MyICons.FONT_FAMILY);
  static const IconData USER_ITEM_LINK =
      const IconData(0xe670, fontFamily: MyICons.FONT_FAMILY);
  static const IconData USER_NOTIFY =
      const IconData(0xe600, fontFamily: MyICons.FONT_FAMILY);

  static const IconData ISSUE_ITEM_ISSUE =
      const IconData(0xe661, fontFamily: MyICons.FONT_FAMILY);
  static const IconData ISSUE_ITEM_COMMENT =
      const IconData(0xe6ba, fontFamily: MyICons.FONT_FAMILY);
  static const IconData ISSUE_ITEM_ADD =
      const IconData(0xe662, fontFamily: MyICons.FONT_FAMILY);

  static const IconData ISSUE_EDIT_H1 = Icons.filter_1;
  static const IconData ISSUE_EDIT_H2 = Icons.filter_2;
  static const IconData ISSUE_EDIT_H3 = Icons.filter_3;
  static const IconData ISSUE_EDIT_BOLD = Icons.format_bold;
  static const IconData ISSUE_EDIT_ITALIC = Icons.format_italic;
  static const IconData ISSUE_EDIT_QUOTE = Icons.format_quote;
  static const IconData ISSUE_EDIT_CODE = Icons.format_shapes;
  static const IconData ISSUE_EDIT_LINK = Icons.insert_link;

  static const IconData NOTIFY_ALL_READ =
      const IconData(0xe62f, fontFamily: MyICons.FONT_FAMILY);

  static const IconData PUSH_ITEM_EDIT = Icons.mode_edit;
  static const IconData PUSH_ITEM_ADD = Icons.add_box;
  static const IconData PUSH_ITEM_MIN = Icons.indeterminate_check_box;
}
class MyScreen {
  ///登入textFiled大小
  static double loginTextFieldFontSize(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    var fontSize = 12.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_20;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_22;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_24;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_26;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }


  ///首頁字體大小
  static double homePageFontSize(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double fontSize = 0.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_20;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_22;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_24;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }
  

  ///一般大小
  static double normalPageFontSize(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double fontSize = 0.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_16;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_20;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_20;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }

  ///通用detailList字體大小
  static double defaultTableCellFontSize(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double fontSize = 0.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_16;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_20;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_22;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }
 
  
  ///appbar button size
  static double appBarFontSize(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double fontSize = 0.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_14;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_16;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_20;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }

  ///登入textFiled大小_span
  static double loginTextFieldFontSize_span(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    var fontSize = 12.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_16;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_20;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_22;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }


  ///首頁字體大小_span
  static double homePageFontSize_span(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double fontSize = 0.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_20;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_22;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_24;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }
  

  ///一般大小_span
  static double normalPageFontSize_span(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double fontSize = 0.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_16;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_20;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_20;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }

  ///通用detailList字體大小_span
  static double defaultTableCellFontSize_span(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double fontSize = 0.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_16;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_20;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_22;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }
 
  
  ///appbar button size_span
  static double appBarFontSize_span(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double fontSize = 0.0;
    if (deviceHeight < 570) {
      fontSize = MyConstant.textSize_14;
    } else if (deviceHeight > 570 && deviceHeight < 720) {
      fontSize = MyConstant.textSize_16;
    } else if (deviceHeight >= 720 && deviceHeight < 800) {
      fontSize = MyConstant.textSize_18;
    } else if (deviceHeight >= 800 && deviceHeight < 900) {
      fontSize = MyConstant.textSize_20;
    } else {
      fontSize = MyConstant.textSize_30;
    }
    return ScreenUtil().setSp(fontSize);
  }
}