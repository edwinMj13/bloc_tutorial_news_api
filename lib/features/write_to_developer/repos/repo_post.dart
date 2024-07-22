import 'dart:convert';

import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/features/write_to_developer/models/write_to_us_data_model.dart';
import 'package:bloc_mini_project_new/utils/api_key.dart';
import 'package:bloc_mini_project_new/utils/error_class.dart';
import 'package:bloc_mini_project_new/utils/utils.dart';
import 'package:http/http.dart' as http;

class RepoPost {
  static postDetails(
      {required String name,
      required String email,
      required String subject,
      required String details}) async {
    // List<BreakingDataModel> brekingList=[];
    try {
      final response = await http
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": subject,
        "body": details,
        "userId": '${name.length}',
      },);
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      print(response.body);
      if (response.statusCode < 200 || response.statusCode>=300) {
        return ErrorClass.fromJson(json);
      } else {
        return WriteToUsDataModel.fromJson(json);
      }
    } catch (e) {
      print("getBreaking Exception $e");
    }
  }
}
