import 'dart:async';
///
///通用dao，所有dao都依照這模式輸出
///Date: 2014-03-20
///
class DataResult {
  var data;
  bool result;
  Future next;

  DataResult(this.data, this.result, {this.next});
}
