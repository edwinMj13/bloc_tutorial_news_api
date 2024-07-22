import 'dart:convert';
ErrorClass errorClassFromJson(String str) => ErrorClass.fromJson(json.decode(str));
String errorClassToJson(ErrorClass data) => json.encode(data.toJson());
class ErrorClass {
  ErrorClass({
      this.status, 
      this.code, 
      this.message,});

  ErrorClass.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }
  String? status;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }

}