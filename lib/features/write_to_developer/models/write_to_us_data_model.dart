import 'dart:convert';
WriteToUsDataModel writeToUsDataModelFromJson(String str) => WriteToUsDataModel.fromJson(json.decode(str));
String writeToUsDataModelToJson(WriteToUsDataModel data) => json.encode(data.toJson());
class WriteToUsDataModel {
  WriteToUsDataModel({
      this.id, 
      this.title, 
      this.body, 
      this.userId,});

  WriteToUsDataModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
  }
  int? id;
  String? title;
  String? body;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    map['userId'] = userId;
    return map;
  }

}