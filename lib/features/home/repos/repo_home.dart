import 'dart:convert';

import 'package:bloc_mini_project_new/features/home/datas/trBr_data_model.dart';
import 'package:bloc_mini_project_new/utils/api_key.dart';
import 'package:bloc_mini_project_new/utils/error_class.dart';
import 'package:bloc_mini_project_new/utils/utils.dart';
import 'package:http/http.dart' as http;

class RepoHome {

  static  getBreakingNow({required String brTag}) async {
   // List<BreakingDataModel> brekingList=[];
    try {
      final response = await http.get(
          Uri.parse("$baseUrl$everythingSectionId$brTag$apiKey"));
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      //print(json);
      if(response.statusCode==429){
        return ErrorClass.fromJson(json);
      }else if(response.statusCode==200) {
        return TrBrDataModel.fromJson(json);
      }
    }catch(e){
      print("getBreaking Exception $e");
    }
  }

  static  getTrendingNow({required String tag}) async {
    // List<BreakingDataModel> brekingList=[];
    try {
      final response = await http.get(
          Uri.parse("$baseUrl$everythingSectionId$tag$apiKey"));
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      // print(json);
      return TrBrDataModel.fromJson(json);
    }catch(e){
      print("getBreaking Exception $e");
    }
  }
}